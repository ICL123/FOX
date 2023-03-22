public with sharing class ContactController {
    
    public List<Contact> contactList {get; set;}
    public List<Account> accountList {get; set;}
    public String input { get; set;}
    public String matchName;
    public boolean checkBox {get; set;}
    
    public ContactController(){
    	getAccount();
    }
    
    public void getAccount() {
        matchName = input+'%';
        accountList = [SELECT Id, Name FROM Account WHERE Name LIKE : matchName];
        contactList = [SELECT Id, Name FROM Contact WHERE Name LIKE : matchName];
    }
    
    public PageReference clearSearchBox() {
        input = '';
        accountList.clear();
        contactList.clear();
        return null;
    }
    
    public PageReference deleteRecord() {
        
        return null;
    }
    
}