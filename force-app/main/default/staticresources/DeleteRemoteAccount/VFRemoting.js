    <script type="text/javascript">
        function deleteRemoteAccount(accId) {
            console.log("Account Id",accId);
        	Visualforce.remoting.Manager.invokeAction(
            	'{!$RemoteAction.AccountManagerController.delAccount}',
            		accId, 
					function(result, event) {
						if(event.type === 'Exception') {
                            console.log(event.type);
                    	}
                        alert("Account has been deleted");
                    }
			);		
    	}
    </script>