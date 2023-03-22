@isTest
private class AccountManagerController_TGN_TEST{
    /*@isTest
    private static void delAccount_TGN_TEST(){
        Database.SaveResult dsr;
        Account drAccount;
        drAccount=new Account();
        dsr=Database.insert(drAccount,false);
        Test.startTest();
        AccountManagerController.delAccount('a');
        AccountManagerController.delAccount('');
        Test.stopTest();
    }*/
    @isTest
    private static void contactLists_TGN_TEST(){
        Database.SaveResult dsr;
        Contact drContact;
        drContact=new Contact(AccountId='003x00000000000AAA');
        dsr=Database.insert(drContact,false);
        Test.startTest();
        AccountManagerController obj = new AccountManagerController();
        obj.contactLists();
        Test.stopTest();
    }

    @isTest
    private static void fetchAccountMethod_TGN_TEST(){
        Database.SaveResult dsr;
        Account drAccount;
        drAccount=new Account();
        dsr=Database.insert(drAccount,false);
        Test.startTest();
        AccountManagerController obj = new AccountManagerController();
        obj.fetchAccountMethod();
        Test.stopTest();
    }
    @isTest
    private static void clearSearchBox_TGN_TEST(){
        Test.startTest();
        AccountManagerController obj = new AccountManagerController();
        obj.clearSearchBox();
        Test.stopTest();
    }
    @isTest(SeeAllData=true)
    private static void getAlphaSearch_TGN_TEST(){
        Database.SaveResult dsr;
        Account drAccount;
        drAccount=new Account();
        dsr=Database.insert(drAccount,false);
        Test.startTest();
        AccountManagerController obj = new AccountManagerController();
        obj.getAlphaSearch();
        Test.stopTest();
    }
    @isTest
    private static void getContactList_TGN_TEST(){
        Test.startTest();
        AccountManagerController obj = new AccountManagerController();
        obj.getContactList();
        Test.stopTest();
    }
}