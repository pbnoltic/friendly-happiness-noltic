public inherited sharing class OpportunityRollupService {
  
  private final Map<String, SObjectField> woodTypeToAmount = new Map<String, SObjectField> {
      'Standard' => Account.TotalSalesStandardWood__c,
      'Recycled' => Account.TotalSalesRecycledWood__c
  };
  
  public void performRollupCalculation(List<Opportunity> newOpportunities, Map<Id, Opportunity> oldOpportunities) {
    Set<Id> accountIds = this.getAccountIdsFromOpportunities(newOpportunities, oldOpportunities);
    if (!accountIds.isEmpty()) {
      List<Account> accountsToUpdate = this.calculateWoodTypeRollup(accountIds).values();
      OpportunityRollupService.doUpdate(accountsToUpdate);
    }
  }
  
  private Set<Id> getAccountIdsFromOpportunities(List<Opportunity> newOpportunities, Map<Id, Opportunity> oldOpportunities) {
    Set<Id> accountIds = new Set<Id>();
    for (Opportunity newOpportunity : newOpportunities) {
      Opportunity oldOpportunity = oldOpportunities?.get(newOpportunity.Id);
      
      if (!this.hasChanges(newOpportunity, oldOpportunity)) {
        continue;
      }
      
      if (this.shouldCalculate(newOpportunity, oldOpportunity)) {
        accountIds.add(newOpportunity.AccountId);
      }
    }
    
    return accountIds;
  }
  
  
  private Boolean shouldCalculate(Opportunity opportunity, Opportunity oldOpportunity) {
    return (this.woodTypeToAmount.containsKey(opportunity.WoodType__c) ||
        (oldOpportunity != null && this.woodTypeToAmount.containsKey(oldOpportunity.WoodType__c)));
  }
  
  private Boolean hasChanges(Opportunity opportunity, Opportunity oldOpportunity) {
    return (oldOpportunity == null ||
        opportunity.Wood_Type__c != oldOpportunity.WoodType__c ||
        opportunity.Amount != oldOpportunity.Amount);
  }
  
  private Map<Id, SObject> calculateWoodTypeRollup(Set<Id> accountIds) {
    Map<Id, SObject> accountsByIds = new Map<Id, SObject>();
    for (AggregateResult result : OpportunitySelector.getGroupedOpportunityByAccountAndType(accountIds, this.woodTypeToAmount.keySet())) {
      Id accountId = (Id) result.get('AccountId');
      String woodType = (String) result.get('WoodType__c');
      Decimal totalAmount = (Decimal) result.get('TotalAmount');
      
      if (!accountsByIds.containsKey(accountId)) {
        accountsByIds.put(accountId, new Account(Id = accountId));
      }
      
      accountsByIds.get(accountId).put(this.woodTypeToAmount.get(woodType), totalAmount);
    }
    
    return accountsByIds;
  }
  
  private static List<Database.SaveResult> doUpdate(List<SObject> sObjects) {
    if (sObjects != null && !sObjects.isEmpty()) {
      return Database.update(sObjects);
    }
    return null;
  }

}