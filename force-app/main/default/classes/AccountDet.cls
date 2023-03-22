public class AccountDet {
    public static void countContact() {
        List<Contact> contactList = [SELECT Name, Account.Name from Contact WHERE Account.Name='Pearl Pet'];
        Integer count = contactList.size();
        List<Account> conQuery = [Select Name, Contact_Count__c from Account where Name='Pearl Pet'];
        for(Account acc :conQuery){
           acc.Contact_Count__c = count;
            System.debug('Updated Account :'+acc);
        }
        update conQuery;
    }
}