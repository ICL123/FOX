trigger Reparenting on Account (before delete) {
    if(trigger.isDelete && trigger.isBefore) {
        Set<id> accountId = new Set<id>();
        for(account ac :trigger.old){
            accountId.add(ac.Id);
        }
        System.debug('the set --'+accountId);
        if(!accountId.isEmpty()) {
            List<Contact> conList = [select id, name from contact where accountId in : accountId];  
            System.debug('the conlist--' + conList);
            if(conList != null){
                Account orphanAcc = [select id,name from account where name = 'Orphan'];
                System.debug('orphan acc --'+orphanAcc);
                if(orphanAcc != null) {
                    for(Contact con :conList){
                        con.accountId = orphanAcc.Id;
                    }
                }
            }
            try{
                update conList;
            }catch(DmlException e) {
                System.debug(e);
            }
        }
    }
}