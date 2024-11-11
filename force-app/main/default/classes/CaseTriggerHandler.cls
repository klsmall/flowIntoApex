public with sharing class CaseTriggerHandler {
    public static void handleBeforeInsert(List<Case> newCases){
        Group rapidResponseQueue = [SELECT Id, Name FROM Group WHERE Type = 'Queue' AND DeveloperName = 'Rapid_Response_Team' LIMIT 1];
        Group generalSupportQueue = [SELECT Id, Name FROM Group WHERE Type = 'Queue' AND DeveloperName = 'General_Support' LIMIT 1];

        for(Case newCase : newCases){
            if(newCase.Priority == 'High'){
                newCase.OwnerId = rapidResponseQueue.Id;
            } else {
                newCase.OwnerId = generalSupportQueue.Id;
            }
        }
    }

    public static void handleBeforeDelete(List<Case> deletedCases){
        for(Case deletedCase : deletedCases){
            if(!deletedCase.IsClosed){
                deletedCase.addError('You cannot delete an open case.');
            }
        }
    }
}