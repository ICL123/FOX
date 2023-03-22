@isTest
public class TestTranslateController {
	
    @isTest
    public static void testLanguage() {
        Test.startTest();
        	TranslateMessage translateMsgObj = new TranslateMessage();
        	translateMsgObj.getLanguageChoosen();
        Test.stopTest();
        System.assert(translateMsgObj.langList != null);
    }
}