public class createAccount {
	Account ac=new Account();
    
    public Account geta(){
        return ac;
    }
    
    public PageReference saveAccount(){
        insert ac;
        return null;
    }
}