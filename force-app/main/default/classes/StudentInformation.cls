public with sharing class StudentInformation {
    public Student__c studentObj { get; set; }
      
    public String languageChoosen{get;set;}
	public List<selectOption> langList {get;set;}
    
    public StudentInformation(ApexPages.StandardController controller) {
     	studentObj = (Student__c) controller.getRecord();
        System.debug('Student info'+studentObj);
   		languageChoosen='en';
        langList = new List<selectOption>();
        langList.add(new selectOption('en','English'));
        langList.add(new selectOption('fr','French'));
        langList.add(new selectOption('es-mx','Spanish'));
   	}
 
    public List<selectOption> getLanguageChoosen() {
		System.debug(langList);
    	return langList;
    }
    public void save() {
        insert studentObj;          
		ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Your admission application has been submitted successfully'));
   	}
 
}