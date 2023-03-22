global class DuplicateLeadBatch implements Database.Batchable<SObject>, Database.Stateful {
    global String query;
    global String filterCriteria;
    global Map<String, Lead> duplicateEmailMap = new Map<String, Lead>();
        
    global Database.QueryLocator start(Database.BatchableContext BC) { 

        List<LeadCriteria__c> leadCriteriaList = LeadCriteria__c.getall().values();
        System.debug('LeadList'+leadCriteriaList);
        
        for(LeadCriteria__c leadCriteriaObj :leadCriteriaList) {
            if(leadCriteriaObj.IsActive__c == true) {
                filterCriteria = leadCriteriaObj.Name;
            }
        }
        System.debug('Filtercriteria : '+filterCriteria);
        
        query = 'SELECT Id, '+filterCriteria+' FROM Lead WHERE'+filterCriteria+'!= null';
        System.debug('Query'+query);
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Lead> scope){

        List<Lead> duplicateList = new List<Lead>();
        
        for(Lead leadObj :scope) {
 			if(!duplicateEmailMap.containsKey((String)leadObj.get(filterCriteria))) {
                duplicateEmailMap.put((String)leadObj.get(filterCriteria),leadObj);
            }
            else {
                duplicateList.add(leadObj);         
            }                        
        }  
        System.debug('Duplicate list : '+duplicateList);
        System.debug('Duplicate list size: '+duplicateList.size());
        if(duplicatelist.size() > 0) {
            delete duplicateList;
        }
    }
    
    global void finish(Database.BatchableContext BC) {
        
    }
}