public class A {
    public Account e {get;set;}
    public id i {get;set;}
    public A(ApexPages.StandardSetController c)
    {
        e = new Account();
        
    }
     public PageReference newenquiry()
    {
        PageReference p=new PageReference('/apex/checkAcc');
        return p;
    }
    public PageReference newcourse()
    {
        PageReference p=new PageReference('/apex/courseInsertion');
        return p;
    }
    public void convertStudent(){
        system.debug('record id ---->'+i);
        e = [SELECT Id,Name FROM Account WHERE ID = :i]; 
        system.debug('Account record ---->'+e);
    }
}