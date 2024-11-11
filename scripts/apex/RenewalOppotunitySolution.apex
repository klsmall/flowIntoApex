public with sharing class OpportunityTriggerHandler {
    public static void handleAfterUpdate(List<Opportunity> updatedOpptys){
        List<Opportunity> renewalOpptys = new List<Opportunity>();

        for(Opportunity oppty : updatedOpptys){
            if(oppty.IsClosed && oppty.IsWon){
                Opportunity newRenewalOppty = new Opportunity(
                    Name = 'XYZ Wrong ' + oppty.Name,
                    AccountId = oppty.AccountId,
                    CloseDate = Date.today().addMonths(12),
                    StageName = 'Prospecting',
                    Type = 'Renewal',
                    LeadSource = 'Renewal'
                );
                renewalOpptys.add(newRenewalOppty);
            }
        }

        try {
            if(!renewalOpptys.isEmpty()){
                insert renewalOpptys;
            }
        } catch(Exception e){
            System.debug('Error: ' + e.getMessage());
        }
    }
}