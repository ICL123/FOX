public class VisitCount {
    public Id accountId;
    public VisitCount(ApexPages.StandardController controller) {
        
    }
    public void init() {
        accountId = ApexPages.currentPage().getParameters().get('Id');
        Account currentRecord = [Select Id, Name, Visited_Count__c from Account where ID =: accountId];
        if(currentRecord.Visited_Count__c == null) {
            currentRecord.Visited_Count__c = 1;
            update currentRecord;
        }
        else {
            if(currentRecord.Visited_Count__c != null) {
                currentRecord.Visited_Count__c = currentRecord.Visited_Count__c + 1;
                update currentRecord;
            }
        }
        return;
    }
}
/*public class VisitCount {

List<Account> accList;
@TestVisible
Id accID;
private final Account acct;

public VisitCount(ApexPages.standardController stdController) {                
acct = (Account)stdController.getRecord();
accId = acct.Id;
}
public void updateCounter(){
accList = [SELECT Id, Visited_Count__c FROM ACCOUNT WHERE Id =: accID];
Account obj;
obj.Visited_Count__c = 1;
for(Account acc :accList){
acc.Visited_Count__c = acc.Visited_Count__c + 1;
}
update accList;
}
}*/