public inherited sharing class OpportunitySelector {
  
  public static List<AggregateResult> getGroupedOpportunityByAccountAndType(Set<Id> accountIds, Set<String> types) {
    return [SELECT AccountId, WoodType__c, SUM(Amount) totalAmount
            FROM Opportunity
            WHERE AccountId IN :accountIds AND WoodType__c IN :types
            GROUP BY AccountId, WoodType__c];
  }

}