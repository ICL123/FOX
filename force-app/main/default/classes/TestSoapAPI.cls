@isTest
public with sharing class TestSoapAPI {
 @isTest
    private static void testNewLead(){
        Test.startTest();
       		String leadId = LeadManager.newLead('Sachin','Tendulkar','srt@gmail.com','1234567','eternus');
    	Test.stopTest();
        System.assertNotEquals(null, leadId);
    }
    
    @isTest
    private static void testUpdateLead(){
        Test.startTest();
        	String leadId = LeadManager.updateLead('Sachin','Tendulkar','srt@gmail.com','1231111','eternus');
    	Test.stopTest();
        System.assertnotEquals(null, leadId);
    }
    
    @isTest
    private static void testDeleteLead(){
        Test.startTest();
        	String leadId = LeadManager.deleteLead('Sachin','Tendulkar','srt@gmail.com','98986565');
    	Test.stopTest();
    }   
}