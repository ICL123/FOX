public class DMLStatement {
    public static void dmlMethod() {
     	List<Lead> ldList = new List<Lead>();
        List<Logs__c> logList = new List<Logs__c>();
        
        for(Integer i = 0; i < 10; i++)
        {
            Lead l = new Lead(LastName = 'Leads' + i, Company = 'Test' + i);
            ldList.add(l);
        }
        Lead l1 = new Lead(LastName = 'LeadTest');
        ldList.add(l1); 
        database.SaveResult[] svr = Database.insert(ldList, False);
        System.debug(ldList);
        for(database.SaveResult sr :svr)
        {
            if(sr.isSuccess())
            {
                System.debug('Successfully inserted account. Lead Id : '+sr.getId());
            }
            else
            {
                for(Database.Error err :sr.getErrors())
                {
                    Logs__c l2 = new Logs__c(Error__c = err.getMessage());
                    logList.add(l2);
                    System.debug('Occured errors '+err.getStatusCode()+err.getMessage());
                    System.debug('Fields affected due to this error are '+err.getFields());
                }
            }
        }
        Insert logList;
    }
    
    //Delete inactive records created in last 90 Days:
    public static void delAccount() {
        List<Account> accList = [SELECT Name, Active__c, CreatedDate FROM Account WHERE Active__c = 'No' AND CreatedDate = LAST_N_DAYS:90];
        Delete accList;
    }
}