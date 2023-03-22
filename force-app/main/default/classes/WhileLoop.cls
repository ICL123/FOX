public class WhileLoop {
    public static void fetchAccountRecords(){
        List<Account> accs = [SELECT Id, Name FROM Account where AccountNumber='123'];
        System.debug('Account size:'+accs.size());
        Integer i=0;
        while(i<accs.size())
        {
            System.debug(accs[i]);
            i++;
        }
    }
}