public class OpportunityRecord {
    public static void fetchRecords() {
map<Id, list<Opportunity>> mapAccountId_Opportunities = new map<Id, list<Opportunity>>();

//Get All Closed Opportunity Size
map<Id, integer> mapAccountID_ClosedOpportunitySize = new map<Id, integer>();

For(Account objAcc : [select Id, Name,
                      (select Id from Opportunities where StageName='Closed Won') from Account Limit 50000] ){
                 mapAccountId_Opportunities.put(objAcc.Id, objAcc.Opportunities) ;
                 mapAccountID_ClosedOpportunitySize.put(objAcc.Id, objAcc.Opportunities.size());
    }

system.debug('-mapAccountId_Opportunities-'+mapAccountId_Opportunities);
system.debug('-mapAccountID_ClosedOpportunitySize-'+mapAccountID_ClosedOpportunitySize);
    }}