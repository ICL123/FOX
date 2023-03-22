public with sharing class SearchAccount {
    @AuraEnabled(Cacheable=true)
    public static List<Account> getAccount(String searchKey){
        try {
            searchKey = '%' + searchKey + '%';
            List<Account> accountList = [Select Id, Name from Account where Name Like:searchKey];
            return accountList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        
    }
}