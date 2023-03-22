public class RelationshipQuery {
    
    public static void displayContact() {
		List<Account> accList = [SELECT AccountNumber, Name FROM Account WHERE Active__c='Yes' AND Industry='Media'];
        for(Account a :accList) {
            List<Contact> conList = [SELECT Name, Account.Name From Contact WHERE AccountId =: a.Id];
		    System.debug(conList);
        }
    }
    
    public static void printDetails() {
           List<C__c> cList = [Select Name, A__r.Name, B__r.Name FROM C__c Where Name = 'John'];
        System.debug(cList);
    } 
    
    public static void printAcc() {
        List<Account> accountList = [SELECT Name, AccountNumber, (SELECT Name, Email FROM Contacts WHERE Name Like '%John%') FROM Account];
        System.debug(accountList);
    }
    
    public static void printOpportunity() {
        List<Account> accountList = [SELECT Name, (SELECT Name FROM Opportunities where StageName='Closed Won') FROM Account];
        System.debug(accountList);
    }
    
    public static void parentDetails() {
        List<A__c> alist = [SELECT Name, (SELECT Name FROM C__r WHERE Name='John') FROM A__c];
        System.debug(alist);	
    }
}