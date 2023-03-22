@istest
public class TestAccountController {
    @testSetup
    static void setup() {
        
        List<Account> accountList = new List<Account>();
        for(Integer i = 0; i < 5; i++) {
            accountList.add(new Account(Name = 'TestAccount' + i, Type = 'Prospect', BillingPostalCode = '41100' + i, BillingCountry = 'India'));
        }
        insert accountList;

		List<Contact> contactList = new List<Contact>();
        for(Integer i = 0; i < 5; i++) {
            contactList.add(new Contact(LastName = 'Demo' + i, Email = 'test.demo' + i +'@gmail.com', Phone = '020-9988765' + i));
        }        
        insert contactList;
        
    }
    
    @istest
    public static void myTestMethod(){
        
        PageReference PageRef = Page.CheckAccount;
        Test.setCurrentPage(PageRef);
  
        Account accountObj = new Account();
        accountObj.Name = 'TestAccount';
        accountObj.BillingCountry = 'India';
        accountObj.BillingCity = 'Pune';
        insert accountObj;
        System.assert(accountObj != null);
        
        Contact contactObj = new Contact();
		contactObj.LastName = 'Gund';
        contactObj.Email = 'gund@yahoo.com';
        contactObj.Phone = '94125543675';
        insert contactObj;
        System.assert(contactObj != null);
        
        AccountManagerController accControllerObj = new AccountManagerController();
        
        Test.startTest();
        
        	accControllerObj.alphabet = new list<String>{'A'};
        	accControllerObj.getAlphaSearch();
        
        	accControllerObj.matchName = 'test';
        	System.assertEquals('test', accControllerObj.matchName);
        	
        	accControllerObj.alphaSearchAccount = 'T';
        	accControllerObj.getAlphaSearch();
        	System.assertEquals('T', accControllerObj.alphaSearchAccount);
        	
        	accControllerObj.alphaSearchAccount = 'All';
        	accControllerObj.getAlphaSearch();
        	System.assertEquals('All', accControllerObj.alphaSearchAccount);
        
        	Account ac = new Account(Name = 'Test');
        	insert ac;
        	PageReference ref = new PageReference('CheckAccount');
        	Test.setCurrentPage(ref);
        	accControllerObj.inputBox = 'Test';
        	ApexPages.currentPage().getParameters().put('accountID', 'Test');
        	accControllerObj.contactLists();
			
   			accControllerObj.clearSearchBox();
        	
        	accControllerObj.getcontactList();
        
        	Account accObj = new Account(Name = 'TestData');
        	insert accObj;
        	AccountManagerController.delAccount(accObj.Id);
        
        Test.stopTest();
    }   
}