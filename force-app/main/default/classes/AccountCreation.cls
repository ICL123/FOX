@RestResource(urlMapping='/createAccount/*')
global with sharing class AccountCreation {
 	@HttpPost
 	global static String createAccount(String AccName) {
 		Account accObj = new Account();
  		accObj.Name = AccName;
  		insert accObj;
  		String returnResponse = JSON.serialize(accObj);
  		return returnResponse;
 	}
}