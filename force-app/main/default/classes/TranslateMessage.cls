public with sharing class TranslateMessage {
    
    public String languageChoosen {get; set;}
	public List<selectOption> langList {get; set;}
    
    public translateMessage() {
     	
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
}