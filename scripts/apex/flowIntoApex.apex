// get a list of closed opportunities
List<Opportunity> closedOpptys = [
    SELECT Id, Name, StageName, IsClosed, IsWon, NextStep 
    FROM Opportunity 
    WHERE IsClosed = True
];

// create a list to hold the updated opportunities
List<Opportunity> updatedOpptys = new List<Opportunity>();

// loop through the closed opportunities and update the NextStep field
for(Opportunity oppty : closedOpptys) {
    if(oppty.IsWon) {
        oppty.NextStep = 'Nurture and upsell';
    } 
    else {
        oppty.NextStep = 'Reach out to client for feedback';
    }
    updatedOpptys.add(oppty);
}

// update the opportunities
try {
    update updatedOpptys;
}
catch(DmlException dmlError) {
    System.debug('The following error has occurred: ' + dmlError.getMessage());
}