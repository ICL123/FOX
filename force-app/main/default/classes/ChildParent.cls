public class ChildParent {
    public static void child() {
		List<Contact> conList=[SELECT FirstName,LastName,Account.Name FROM Contact WHERE Account.Name='ESPL'];
        
        for(Contact c:conList) {
        	System.debug('First Name : '+c.FirstName+' Last Name : '+c.LastName+' Account Name : '+c.Account.Name);    
        }
    }
}