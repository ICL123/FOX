public class UpdateAccount {
    
    public UpdateAccount(ApexPages.StandardController controller) {

    }

    public PageReference accountPage() {
        return Page.AccountDetails;
    }
    
    public PageReference editPage() {
        return Page.editPage;
    }
    
    public PageReference nextPage() {
        return Page.nextPage;
    }
}