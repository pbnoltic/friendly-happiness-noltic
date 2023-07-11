public with sharing class OpportunityTriggerHandler {

  public static void execute() {
    if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
      new OpportunityRollupService().performRollupCalculation(Trigger.new, (Map<Id, Opportunity>) Trigger.oldMap);
    }
  }
  
}