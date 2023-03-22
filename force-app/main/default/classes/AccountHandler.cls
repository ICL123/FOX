/*public class AccountHandler {
	public static void insertNewAccount(Integer newAcc)
    {
        Integer i=1;
        List<Account> addAccounts=new List<Account>();
        while(i<=newAcc)
        {
            Account store=new Account();
            store.Name='Acme Inc N'+i;
            store.AccountNumber='A000n'+i;
            addAccounts.add(store);
            System.debug(addAccounts);
            i=i+1;
        }
        insert addAccounts;
    }
}*/
public class AccountHandler {

    public static Account insertNewAccount(String accName){
        
        
    if(accName!=''){    
        try{
            Account a = new Account(Name=accName);
            insert a;
            System.debug('Bravo Andrè! Account created');
            return a;
        } catch(Exception e){
            System.Debug('Account not created');
            return null;
        }
    } else {
        return null;
    }
     
        
    }    
}