global class RemoveDuplicateLeads implements Database.Batchable<sObject>, Database.Stateful {

	Map<String,Integer> countMap = new Map<String,Integer>();
    global String filterCriteria;
	
	global RemoveDuplicateLeads() {
		Database.QueryLocatorIterator iterator = Database.getQueryLocator('select Email from Lead').iterator();
		while (iterator.hasNext()) {
			Lead leadRecord = (Lead) iterator.next();
			if(leadRecord.get(LeadCriteria__c.IsActive__c) == true) {
				countMap.put((String)leadRecord.get(LeadCriteria__c.IsActive__c), 0);
			}
		}
	}

/**
This method will start the batch execution.
@return Database.QueryLocator - This will contain all Leads.
*/
	global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator('select ' + LeadCriteria__c.IsActive__c + ' from lead');
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