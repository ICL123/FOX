global class UpdateCompany implements Database.Batchable<sObject> {
    private Integer count=0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id__c,Name,Revenue__c FROM Company__c]);
    }
    
    global void execute(Database.BatchableContext bc,List<Company__c> compList) {
        for(Company__c c: compList) {
            c.Revenue__c=200000;
        }
        update compList;
        count=compList.size();
    }	
    
    global void finish(Database.BatchableContext bc) {
        System.debug('Company Count :'+count);
        Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
        
        String[] toAddr=new String[]{'saurabh.gund@eternussolutions.com','sjgund9795@gmail.com'};
        mail.setToAddresses(toAddr);
        mail.setSubject('Regarding Annual Revenue');
        mail.setPlainTextBody('Hello'+toAddr+'\nOur anuual revenue is updated. Please check');	
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }
}