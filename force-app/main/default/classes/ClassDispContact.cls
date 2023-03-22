public with sharing class ClassDispContact {
        public List<Contact> contactList { get;set; }
        public String inputBox { get;set; }
        public List<Account> listOfAccount { get;set; }
        public Integer accountSize { get; set; }
        public String matchName;
        public String selectedAccountId { get; set; }
        public static Account account { get; set; }
        public String accountName { get; set; }
       
        public ClassDispContact() {
           fetchAccountMethod();
        }
        
        @RemoteAction
        public static void delAccount(String accountId) {
            account = [SELECT Id, Name FROM Account WHERE Id =: accountId];
            delete account;
        }
        
        public ClassDispContact(ApexPages.StandardSetController controller) {
    
        }
       
        public PageReference listOfContact() {
            if(ApexPages.currentPage().getParameters().get('id') != null)
                contactList = [SELECT Id, Name, Phone, Email FROM Contact WHERE accountId =: ApexPages.currentPage().getParameters().get('id')];
            return null;
        }
        
        public PageReference clearSearchBox() {
            inputBox = ' ';
            listOfAccount.clear();
            return null;
        }
       
        public void fetchAccountMethod() { 
            matchName = '%'+InputBox+'%';
            listOfAccount = [SELECT Id, Name, Type FROM Account WHERE Name Like:matchName];
            accountSize=listOfAccount.size();
           
        }
       
        public void deleteAccount() {
          if (SelectedAccountId == null) {
             return;
          }
         
          Account tobeDeleted = null;
            for(Account accountObj :listOfAccount)
            if (accountObj.Id == selectedAccountId) {
                tobeDeleted = accountObj;
                break;
            }
         
            if (tobeDeleted != null) {
                delete tobeDeleted;
                pagereference pg = new pagereference('/apex/AccountManager');
                pg.setredirect(true);
            }
          fetchAccountMethod();
        }    
       
        list<Account> accountList = [SELECT Name, Id, createdById, billingPostalCode, billingCountry, billingCity, billingstreet, Type, Website FROM Account];
        public list<String> alphabet{
            get{                                                                                                                    
                alphabet = new list<string>{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','Others','All'};
                    return alphabet;        
            }
            set;
        }
        public String alphaSearchAccount{get;set;}     
        public Pagereference getAlphaSearch(){     
           
            if (alphaSearchAccount=='All'){
                accountList= [SELECT Name, Id, createdById, billingPostalCode, billingCountry, billingCity, billingstreet, Type, Website FROM Account];
            }
            else{
                accountList= [SELECT Name, Id, createdById, billingPostalCode, billingCountry, billingCity, billingstreet, Type, Website FROM Account WHERE Name LIKE :alphaSearchAccount+'%'];
            }
           
            return null;
        }            
       
        public list<Account> getContactList(){                               
            return (accountList);
        }
}