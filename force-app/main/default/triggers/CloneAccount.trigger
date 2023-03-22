trigger CloneAccount on Account (before insert) {
    if(TriggerSetting__c.getInstance().IsActive__c == true) {  
        if(CheckRecursive.runOnce()) {
            List<Account> accountList = new List<Account>();
            accountList = Trigger.new.deepClone();
            insert accountList;
        }
    }
}