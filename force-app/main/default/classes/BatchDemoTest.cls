@isTest
public class BatchDemoTest {
	@isTest
    private static void testBatchClass() {
        List<Opportunity> oppList=new List<Opportunity>();
        
        for(Integer i=0;i<5;i++) {
            oppList.add(new Opportunity(Name='Demo'+i,StageName='Prospect',CloseDate=system.today()));
        }
        insert oppList;
        
        Test.startTest();
        	BatchDemo bd=new BatchDemo();
        	Id batchId=Database.executeBatch(bd,5);
        Test.stopTest();
        
        List<Opportunity> updOpp=[SELECT Id FROM Opportunity WHERE LeadSource='Web'];
        System.assertEquals(5, updOpp.size());
    }   
}