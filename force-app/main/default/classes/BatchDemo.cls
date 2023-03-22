public class BatchDemo implements Database.Batchable<sObject>,Database.stateful {
    
    public Integer recCount=0;
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id,Name FROM Opportunity]);
    }
    
    public void execute(Database.BatchableContext bc,List<Opportunity> opp) {
        for(Opportunity op:opp) {
            op.LeadSource='Web';
        }
        update opp;
        recCount=opp.size();
    }
    
    public void finish(Database.BatchableContext bc) {
        System.debug('Processed records count : '+recCount);
    }
}