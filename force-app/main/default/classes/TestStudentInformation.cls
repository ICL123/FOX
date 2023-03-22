@isTest
public class TestStudentInformation {
	@testSetup
    static void setup() {
       List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 5; i++) {
            studentList.add(new Student__c(	Roll_Number__c = 22+i, Name = 'Rohan', 	Gender__c = 'Male'));
        }
        insert studentList;
    }
    
    @isTest
    public static void testStudent() {
        Test.startTest();
			Student__c studentObj = new Student__c();
        	ApexPages.StandardController sc = new ApexPages.StandardController(studentObj);
        	StudentInformation studentInfoObj = new StudentInformation(sc);
        	studentInfoObj.getLanguageChoosen();
        	studentInfoObj.save();
        Test.stopTest();
        System.assert(studentInfoObj.save() != null);
        System.assert(studentInfoObj.langList != null);
    }
}