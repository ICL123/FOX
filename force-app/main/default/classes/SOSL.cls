public class SOSL {
    public static void searchObject() {
		List<List<sObject>> searchList = new List<List<sObject>>();
        searchList=[Find 'test' IN NAME FIELDS returning Account, Contact, Lead, User];
        System.debug(searchList);
    }
}