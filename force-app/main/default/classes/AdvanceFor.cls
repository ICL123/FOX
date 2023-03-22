public class AdvanceFor {
	public static void fetchAccountRecord() {
        List<Account> accountList = [SELECT Id, Name FROM Account where AccountNumber!=Null];
    	for(Account a :accountList) {
            System.debug('ID : '+a.ID+'\nName : '+a.Name);
        }
    }
}