@RestResource(urlMapping='/v1/accountRecordCreate/*')
global class AccountCreateAPI {
    
    global class responseWrapper {
        public string wName;
        //public string wPhone;
    }
    
    @HttpGet
    global Static Account getAccount() {
        RestRequest req = RestContext.request;
        String accountNo = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1);
        System.debug('accountNo : '+ accountNo);
        
        List<Account> accList = [Select Id, Name from Account where Id =: accountNo];
        if(accList.size() > 0) {
            return accList[0];
        }
        
        return null;
    }
    
    @HttpPost
    global Static responseWrapper createAccount(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String jsonString = req.requestBody.tostring();
        System.debug('JsonString-->>'+jsonString);
        
        responseWrapper wResp = (responseWrapper)JSON.deserialize(jsonString, responseWrapper.class);
        System.debug('WResp-->>'+wResp);
        
        Account acc = (Account)JSON.deserialize(jsonString, Account.class);
        acc.Name = wResp.wName;
        //acc.Phone=wResp.wPhone;
        
        System.debug('acc'+acc);
        
        try {
        	insert acc;    
        } catch(Exception e) {
            //return e.getMessage();
        }
        wResp.wName = acc.Name;
        return wResp;
    }
}