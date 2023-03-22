public class TradFor {
    public static void fetchAccountRecord() {
        Integer count=0;
        List<Account> accs = [SELECT Id, Name FROM Account where AccountNumber!=Null];
    	for(Integer i = 0; i < accs.size(); i++) {
            System.debug(accs[i]);
        }
    }
}