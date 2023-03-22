({
    navToRecord : function (component, event, helper) {
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": component.get("v.Order.Id")
        });
        navEvt.fire();
    },
    doInit : function(component, event, helper) {
        var actions = [
            {label: 'View', name: 'view'},
            {label: 'Edit', name: 'edit'},
            {label: 'Delete', name: 'delete'}
        ];
        component.set('v.mycolumns', [
            {label: 'Customer__c', fieldName: 'Customer__c', type: 'text'},
            {label: 'Delivered_By__c', fieldName: 'Delivered_By__c', type: 'text'},
            {label: 'Order_Date__c', fieldName: 'Order_Date__c', type: 'text'},
            {label: 'Paid_In_Advance__c', fieldName: 'Paid_In_Advance__c', type: 'phone'},
            {type: 'action', typeAttributes: { rowActions: actions } } 
        ]);
          helper.pullData(component);
       
    },
     handleRowAction: function (component, event, helper) {
        var action = event.getParam('action');
        switch (action.name) {
            
            case 'delete':
                helper.deleteRecord(component, event);
                break;
        }
    },
    deleteRecord : function(component, event, helper) {
        // component.set("v.isLoading", true);
        var accountRec = event.getParam('row');        
        var action = component.get("c.delAccount");
        action.setParams({
            "accountRec": accountRec
        });
    },
    

    handleSuccess : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "The property's info has been updated.",
            "type": "success"
        });
        toastEvent.fire();
        helper.showHide(component);
    },
    handleCancel : function(component, event, helper) {
        helper.showHide(component);
        event.preventDefault();
    },
    
})