public with sharing class BaseController {
  
  @AuraEnabled(Cacheable=true)
  public static List<Account> getAccounts(){
    return BaseSelector.getAccounts();
  }
  
  @AuraEnabled(Cacheable=true)
  public static List<Contact> getContactsByAccountId(String accountId){
    return BaseSelector.getContactsByAccountId(accountId);
  }

}