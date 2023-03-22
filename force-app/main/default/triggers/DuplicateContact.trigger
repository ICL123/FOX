trigger DuplicateContact on Contact (before insert,before update) {
    if(TriggerSetting__c.getInstance().IsActive__c == true) {
    	Map<String,String> emailVsNameMap = new Map<String,String>();
    	Map<String,String> phoneVsNameMap = new Map<String,String>();
    
    	List<Contact> contactList = [SELECT Name,Email,Phone FROM Contact];
    	for(Contact conObj:contactList) {
        	if(conObj.Email != null)
        		emailVsNameMap.put(conObj.Email,conObj.Name);
        	if(conObj.Phone != Null)
        		phoneVsNameMap.put(conObj.Phone,conObj.Name);
    	}
    
    	for(Contact conObj:Trigger.new) {
        	System.debug('Inside for loop');
        	if(emailVsNameMap.containsKey(conObj.Email) && conObj.Email != Null) {
            	System.debug('Inside if');
            	conObj.Email.adderror('A contact with same Email address already exists in the system');
        	}
        	else if(phoneVsNameMap.containsKey(conObj.Phone) && conObj.Phone != null) {
            	System.debug('Inside else if');
            	conObj.Phone.adderror('A contact with same Phone number is already exists in the system');
        	}
        	if(conObj.Email != null)
        		emailVsNameMap.put(conObj.Email,conObj.Name);
        	if(conObj.Phone != Null)
        		phoneVsNameMap.put(conObj.Phone,conObj.Name);
    	}
    }
}