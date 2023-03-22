global class AssignAccount implements Database.Batchable <sObject> {
    
    List<Account> lstCon = new List<Account>();
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id, Name FROM Contact WHERE Id NOT IN(SELECT ContactId FROM Account)';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc,List<Contact> batch) {
        for (Contact a : batch) {
            Account c =  new Account();
            c.Name = a.LastName+'Account';
            //c.ContactId = a.Id;
            lstCon.add(c);
        }
        INSERT lstCon;
    }
    
    global void finish(Database.BatchableContext bc) {
        //Do Nothing.
    }
}