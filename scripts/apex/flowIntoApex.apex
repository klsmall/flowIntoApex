List<Opportunity> closedOpptys = [
    SELECT Id, Name, StageName, IsClosed, IsWon, NextStep 
    FROM Opportunity 
    WHERE IsClosed = True
];

List<Opportunity> updatedOpptys = new List<Opportunity>();

for(Opportunity oppty : closedOpptys) {
    if(oppty.IsWon) {
        oppty.NextStep = 'Nurture and upsell';
        updatedOpptys.add(oppty);
    } else {
       oppty.NextStep = 'Reach out to client for feedback';
         updatedOpptys.add(oppty);
    }
}

update updatedOpptys;