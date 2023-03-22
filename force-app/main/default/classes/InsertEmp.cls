public class InsertEmp {
	Employee1__c e=new Employee1__c();
    
    public Employee1__c gete(){
        return e;
    }

    public PageReference insertRec() {
        insert e;
        return null;
    }
}