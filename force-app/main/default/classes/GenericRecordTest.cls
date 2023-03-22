@isTest
public class GenericRecordTest {
	@isTest
    private static void testContactRecord() {
        
        Contact conObj = new Contact();
        conObj.LastName='Diwate';
        conObj.Email='sdiwate@gmail.com';
        
        insert conObj;
 
		GenericRecordCreationEngine abs= new GenericRecordCreationEngine();
		String jobId = System.schedule('myJobTestJobName', '0 20 * * * ?', abs);
		abs.execute(null);
        
        
        Contact updatedContact = [SELECT LastName FROM Contact WHERE LastName = 'Diwate'];
		System.assertEquals('Diwate', updatedContact.LastName);
    }

}