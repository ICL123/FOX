trigger ContactMailDomainTrigger on Contact (before insert) {
    List<String> contactEmaildomains = new List<String>();
    for(Contact con : Trigger.new){
        contactEmaildomains.add('%'+con.Domain__c+'%');
    }
    List<Account> accList = [SELECT Id, Domain__c FROM Account WHERE Domain__c LIKE :contactEmaildomains];
    Map<String, Id> domainsMap = new Map<String, Id>();
    for(Account a: accList) {
        for(String dom : a.Domain__c.Split(','))
            domainsMap.put(dom, a.Id);
    }
    for(Contact c: Trigger.new) {
        if(domainsMap.get(c.Domain__c) != null) {
            c.AccountId = domainsMap.get(c.Domain__c);
        } 
    }
}