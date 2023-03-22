public with sharing class OpenMapApiController {
    String city {get; set;}
    String temp {get; set;}
    String pressure {get; set;}
    String temp_min {get; set;}
    String temp_max {get; set;}
    
    public OpenMapApiController(ApexPages.StandardController controller) {
        Account accountObj = (Account)controller.getRecord();
        accountObj = [Select Id, ShippingCity from Account where Id =: accountObj.Id];
    }
}