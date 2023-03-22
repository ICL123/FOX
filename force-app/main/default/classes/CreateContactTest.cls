@isTest
public class CreateContactTest {
    
    public static testmethod void testContact() {
        List<Account> accountList = new List<Account>();
        List<Contact> contactList = new List<Contact>();
        
        for(Integer i = 0; i<5; i++) {
            Account acc = new Account();
            acc.Name = 'Sample'+i;
            acc.Email_Id__c = 'SampleMail@gmail'+i+'.com';
            accountList.add(acc);
            
            Contact con = new Contact();
            con.LastName = 'Stark';
            con.Email = 'tonystark@gmail'+i+'.com';
            contactList.add(con);
        }
        System.debug('Account List : '+accountList);
        System.debug('Contact List : '+contactList);
        
 
        Test.startTest();
        Insert accountList;
        Insert contactList;
        Test.stopTest();
        
        System.debug('Bulk');
        List<Contact> contactList1 = [SELECT Id, AccountId FROM Contact WHERE Id IN : contactList ORDER BY Id];
        for(Integer i = 0; i < 5; i++) {
            System.assertEquals(accountList[i].Id, contactList1[i].AccountId);
        }
    }
    
    private static testmethod void testPositive() {
        List<Account> accountList = new List<Account>();
        Account acc = new Account();
        acc.Name='ABC';
        acc.Email_Id__c='abc@pqr.com';
        accountList.add(acc);

        
        List<Contact> contactList = new List<Contact>();
        Contact con = new Contact();
        con.LastName = 'Pritam';
        con.Email = 'pritam@pqr.com';
        con.Phone = '908765';
        contactList.add(con);
        
        Test.startTest();
        	Insert accountList;
        	Insert contactList;
        Test.stopTest();
        
        Account updatedAccount = [SELECT Name, Email_Id__c FROM Account WHERE Id =: acc.Id];
        System.assertEquals(acc.Email_Id__c, updatedAccount.Email_Id__c);
        
        Contact updatedContact = [SELECT LastName, Email FROM Contact WHERE Id =: con.Id];
        System.assertEquals(con.Email, updatedContact.Email);
    }
    
    private static testmethod void negativeTest() {
        
        List<Account> accountList = new List<Account>();
        Account acc = new Account();
        acc.Name='NegTest';
        acc.Email_Id__c = 'negtest@gmail.com';
       	accountList.add(acc);
        
        List<Contact> contactList = new List<Contact>();
        Contact con = new Contact();
        con.LastName = 'Pritam';
        con.Email = 'prita@yahoo.com';
        con.Phone = '908765';
        contactList.add(con);
        
        Test.startTest();
        	insert accountList;
        	insert contactList;
        Test.stopTest();
        
        System.debug('AccountList : '+accountList);
        System.debug('ContactList : '+contactList);    
                
        System.debug('Negative Test:');
        Account updatedAccount = [SELECT Name, Email_Id__c FROM Account WHERE Id =: acc.Id];
        System.assertEquals(acc.Email_Id__c, updatedAccount.Email_Id__c);
        
        System.debug('Negative Test:');
        Contact updatedContact = [SELECT LastName, Email FROM Contact WHERE Id =: con.Id];
        System.assertNotEquals(con.AccountId, acc.Id);
    }
}