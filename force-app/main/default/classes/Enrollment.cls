public class Enrollment {
    public static void displayRecords() {
        
        System.debug('Enrollment year = 2010');
        List<Account> accountList1 = [SELECT name FROM account WHERE Enrolment_Year__c = '2010'];
    	System.debug(accountList1);
        
        System.debug('Enrollment year = 2013 or 2014');
        List<Account> accountList2 = [SELECT name FROM account WHERE Enrolment_Year__c = '2013' AND Enrolment_Year__c = '2014'];
        System.debug(accountList2);
        
        System.debug('Enrollment year 2010,2013,2014 accList4');
        List<Account> accountList4 = [SELECT name FROM account WHERE Enrolment_Year__c='2010' OR Enrolment_Year__c INCLUDES ('2013;2014')];
        System.debug(accountList4);
        
        list<Account> accountList3 = [Select Id, Name From Account where BillingState NOT IN ('Maharashtra','Kerala') 
                                      ORDER BY BillingState DESC NULLS LAST LIMIT 10000];
        System.debug(accountList3);
    }
}