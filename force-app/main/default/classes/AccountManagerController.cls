public with sharing class AccountManagerController {
    public List<Contact> conList { get; set; }
    public String inputBox { get; set; }
    public List<Account> listOfAccount { get; set;}
    public Integer accountSize { get; set;}
    public String matchName;
    public static Account account { get; set; }   
    
    public AccountManagerController() {
       fetchAccountMethod();
   	}
    
    @RemoteAction
    public static void delAccount(String accountId) {
        System.debug('accountId : '+accountId);
    	account = [SELECT Id, Name FROM Account WHERE Id =: accountId LIMIT 1];
        System.debug('Remote action : '+account);
        delete account;
	}

    public PageReference contactLists() {
        System.debug('ApexPages.currentPage().getParameters().get(\'accountID\') :' + ApexPages.currentPage().getParameters().get('accountID'));
    	if(ApexPages.currentPage().getParameters().get('id') != null )
      		conList = [SELECT Id, Name, Phone, Email FROM Contact WHERE accountId =: ApexPages.currentPage().getParameters().get('id')];
        else
            conlist = null;
     	return null;
    }   
    	
    public void fetchAccountMethod() {
        matchName = '%'+InputBox+'%';
        listOfAccount = [SELECT Id, Name, Type FROM Account WHERE Name Like : matchName];
        accountSize = listOfAccount.size();
    }
    public PageReference clearSearchBox() {
        inputBox = '';
        listOfAccount.clear();
        accountSize = 0;
        conList = null;
		return null;
    }
    

    //Alphabetical search
    list<Account> accountList = [SELECT Name, Id, createdById, billingPostalCode, billingCountry, billingCity, billingstreet, Type, Email_Id__c, Website FROM Account]; 
    public list<String> alphabet {
        get {                                                                                                                   
            alphabet = new list<String>{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','Others','All'};
                return alphabet;         
        }
        set;
    }
    public String alphaSearchAccount{get;set;}                                                      
    public Pagereference getAlphaSearch() {                                                             
        if (alphaSearchAccount == 'All') {
            accountList = [SELECT Name, Id, createdById, billingPostalCode, billingCountry, billingCity, billingStreet, Type, Website, Email_Id__c FROM Account];
        }
        else {
            accountList = [SELECT Name, Id, createdById, billingPostalCode, billingCountry, billingCity, billingstreet, Type, Website, Email_Id__c FROM Account WHERE Name Like:alphaSearchAccount+'%'];
        }
        
        return null;
    }      
    
    public list<Account> getContactList(){                              
        return (accountList);
    }
}