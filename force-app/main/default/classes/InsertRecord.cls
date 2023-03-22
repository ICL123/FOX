public class InsertRecord {
	Account a=new Account();
    Contact c=new Contact();
    Opportunity o=new Opportunity();
    
    public Account geta() {
        return a;
    }
    
    public Contact getc() {
        return c;
    }
     
    public Opportunity geto() {
        return o;
    }
    
    public PageReference accPage() {
        return Page.insAcc;
    }
    
    public PageReference conPage() {
        return Page.insCon;
    }
    
    public PageReference oppPage() {
        return Page.insOpp;
    }
    
    public PageReference revPage() {
        return Page.review;
    }
    
    public PageReference saveRec() {
        insert a;
        
        c.AccountId=a.Id;
        insert c;
        
        o.AccountId=a.Id;
        insert o;
        
        return null;
    }
}