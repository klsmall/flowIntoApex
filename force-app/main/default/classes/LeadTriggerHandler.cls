public with sharing class LeadTriggerHandler {
    public static void handleAfterInsert(List<Lead> newLeads) {
        List<Task> tasksToInsert = new List<Task>();

        for (Lead lead : newLeads) {
            tasksToInsert.add(new Task(
                WhoId = lead.Id,
                Subject = 'Schedule Demo Call',
                ActivityDate = Date.today().addDays(14)
            ));
        }

        try {
            insert tasksToInsert;
        } catch (DmlException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
}