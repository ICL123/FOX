public class ConAcc {
    public static void childParent() {
		List<Contact> conList=[SELECT FirstName,LastName,Account.Name FROM Contact];
        
        for(Contact c:conList) {
        	System.debug('First Name : '+c.FirstName+' Last Name : '+c.LastName+' Account Name : '+c.Account.Name);    
        }
    }
}