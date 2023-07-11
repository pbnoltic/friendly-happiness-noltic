public inherited sharing class BaseSelector {
  
  public static List<Account> getAccounts() {
    return [SELECT Id, Name  FROM Account];
  }
  
  public static List<Contact> getContactsByAccountId(String accountId) {
    return [SELECT Id, FirstName, LastName, Email FROM Contact WHERE AccountId = :accountId];
  
  }

}