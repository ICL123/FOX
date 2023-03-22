global class RemoveDuplicateLeadBatch implements Database.Batchable<sObject>, Database.Stateful {

	Map<String,Integer> countMap = new Map<String,Integer>();
    global String query;
	global String filterCriteria;

	global RemoveDuplicateLeadBatch() {
        
        List<LeadCriteria__c> leadCriteriaList = LeadCriteria__c.getall().values();
        System.debug('LeadList'+leadCriteriaList);
        for(LeadCriteria__c leadCriteriaObj :leadCriteriaList) {
            if(leadCriteriaObj.IsActive__c == true) {
                filterCriteria = leadCriteriaObj.Name;
            }
        }
		Database.QueryLocatorIterator iterator = Database.getQueryLocator('select ' + filterCriteria + ' from Lead').iterator();
		while (iterator.hasNext()) {
			Lead leadRecord = (Lead) iterator.next();
			if(leadRecord.get(filterCriteria) != null) {
				countMap.put((String)leadRecord.get(filterCriteria), 0);
			}
		}
	}
	
    global Database.QueryLocator start(Database.BatchableContext BC) {
        
        /*List<LeadCriteria__c> leadCriteriaList = LeadCriteria__c.getall().values();
        System.debug('LeadList'+leadCriteriaList);
        
        for(LeadCriteria__c leadCriteriaObj :leadCriteriaList) {
            if(leadCriteriaObj.IsActive__c == true) {
                filterCriteria = leadCriteriaObj.Name;
            }
        }
        System.debug('Filtercriteria : '+filterCriteria);*/
        
        query = 'SELECT Id,'+filterCriteria+' FROM Lead WHERE Email != null';
        System.debug('Query'+query);
        return Database.getQueryLocator(query);
	}

/**
This method will execute for every batch and deletes the duplicate leads.
@return Nothing.
*/
	global void execute(Database.BatchableContext BC, List<sObject> scope) {
		List<Lead> leadList = new List<Lead>();
		for(SObject lead : scope) {
			if(lead.get(LeadCriteria__c.IsActive__c) == true) {
				if(countMap.get((String)lead.get(LeadCriteria__c.IsActive__c)) >= 1 ) {
					leadList.add((Lead)lead);
				} 
                else {
					countMap.put((String)lead.get(LeadCriteria__c.IsActive__c),1);
				}
			}
		}
		Database.delete(leadList,false);
	}
/**
This method will execute at end of Batch apex process.
@return Nothing.
*/
	global void finish(Database.BatchableContext BC) {
        
	}
}