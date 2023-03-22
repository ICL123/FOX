@isTest
private class TestRestClass{
    @isTest
    private static void createLead_TGN_TEST(){
        Test.startTest();
        RestClass.createLead('a','a','a','a','a');
        RestClass.createLead('','','','','');
        Test.stopTest();
    }
    @isTest
    private static void updateLead_TGN_TEST(){
        Database.SaveResult dsr;
        Lead drLead;
        drLead=new Lead(Company='a');
        dsr=Database.insert(drLead,false);
        Test.startTest();
        RestClass.updateLead('a','a','a','a');
        RestClass.updateLead('','','','');
        Test.stopTest();
    }
    @isTest
    private static void deleteLead_TGN_TEST(){
        Database.SaveResult dsr;
        Lead drLead;
        drLead=new Lead(Company='a');
        dsr=Database.insert(drLead,false);
        Test.startTest();
        RestClass.deleteLead();
        Test.stopTest();
    }
    @isTest
    private static void RestClass_TGN_TEST(){
        RestClass obj = new RestClass();
    }
    @isTest
    private static void Result_TGN_TEST(){
        RestClass.Result obj = new RestClass.Result();
    }
}