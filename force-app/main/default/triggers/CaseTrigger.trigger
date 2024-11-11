trigger CaseTrigger on Case (before insert, before delete) {
    if (Trigger.isBefore && Trigger.isInsert) {
        CaseTriggerHandler.handleBeforeInsert(Trigger.new);
    }
    if (Trigger.isBefore && Trigger.isDelete) {
        CaseTriggerHandler.handleBeforeDelete(Trigger.old);
    }
}