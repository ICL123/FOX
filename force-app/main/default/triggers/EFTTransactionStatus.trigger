trigger EFTTransactionStatus on EFt_Transaction_Status__c (after insert, after update) {
    Group QueueList = [SELECT Id, Name FROM Group WHERE Type = 'Queue' AND Name = 'AVS Queues'];
    
    List<Case> caseList = new List<Case>();
    
    List<EFt_Transaction_Status__c> eftTransactionList = [SELECT Method_Name__c, EFt_Transaction_Status__c.Name, Transaction_Status__c,Transaction_Date__c,
                                            SalesHeader__r.Name, SalesHeader__r.Status__c,SalesHeader__r.Account__c,
                                            SalesHeader__r.Account__r.Name, SalesHeader__r.Contact__c FROM EFt_Transaction_Status__c];
    
    for(EFt_Transaction_Status__c eftObj :eftTransactionList) {
        
        System.debug(eftObj.Method_Name__c);
        System.debug(eftObj.Transaction_Status__c);
        System.debug(eftObj.SalesHeader__r.Status__c);
        
        if(eftObj.Method_Name__c == 'Credit Card address Verify' && eftObj.Transaction_Status__c == 'Declined' && eftObj.SalesHeader__r.Status__c == 'Open') {
            
            Case caseObj = new Case();
            
            caseObj.AccountId = eftObj.SalesHeader__r.Account__c;
            caseObj.ContactId = eftObj.SalesHeader__r.Contact__c;
            caseObj.RecordTypeId = '012Iw000000IphBIAS';
            caseObj.Origin = 'Internal';
            caseObj.Reason = 'Address Did Not Verify';
            caseObj.Priority = 'High';
            caseObj.Status = 'New';
            caseObj.Type = 'Address Did Not Verify';
            caseObj.Subject = eftObj.SalesHeader__r.Account__r.Name+' '+caseObj.Type;
            caseObj.Open_Sales_Order__c = eftObj.SalesHeader__r.Id;
            caseObj.Transaction_Status__c = eftObj.Transaction_Status__c;
            caseObj.Sales_Order_Number__c = eftObj.SalesHeader__r.Name;
            caseObj.Order_Date__c = eftObj.Transaction_Date__c;
            caseList.add(caseObj);  
        }
    }
    insert caseList;
}