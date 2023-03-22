({
    showHide : function(component) {
        var editForm = component.find("editForm");
        $A.util.toggleClass(editForm, "slds-hide");
        var viewForm = component.find("viewForm");
        $A.util.toggleClass(viewForm, "slds-hide");
        
    },
    pullData:function(component){
        component.set("v.isLoading", true);
         var action = component.get("c.getSimilarProperties");
         action.setParams({
            recordId: component.get("v.recordId"),
            searchCriteria: component.get("v.searchCriteria")
              });       
        action.setCallback(this,function(e){
            component.set("v.isLoading", false);
            if(e.getState()=='SUCCESS'){
                var results=e.getReturnValue();                 
                if(results.length>0){
                    component.set('v.results', results);                                                           
                }
                else{
                    component.set('v.results', []);                                        
                }
            }
            else{
                this.showToast("ERROR","error",JSON.stringify(e.getError()));   
            }
        });
        $A.enqueueAction(action);
    },
    deleteRecord : function(component, event) {
        component.set("v.isLoading", true);
        var accountRec = event.getParam('row');        
        var action = component.get("c.delAccount");
        action.setParams({
            "accountRec": accountRec
        });
        action.setCallback(this, function(response) {
            component.set("v.isLoading", false);            
            if (response.getState() === "SUCCESS" ) {
                var rows = component.get('v.results');
                var rowIndex = rows.indexOf(accountRec);
                rows.splice(rowIndex, 1);
                component.set('v.results', rows);
                this.showToast("Success!","success","The record has been delete successfully.");
            }
            else{
                this.showToast("ERROR","error",JSON.stringify(response.getError())); 
            }
        });
        $A.enqueueAction(action);
    },
    
    showToast:function(title,type,message){
        var toastEvent = $A.get("e.force:showToast");
        if(toastEvent){
            toastEvent.setParams({"title": title,"type": type,"message": message}).fire();
        }
        else{
            alert(message);
        }
    },
    
})