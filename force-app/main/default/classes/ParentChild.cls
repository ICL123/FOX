public class ParentChild {
    public static void parent() {
        List<Account> accList = [SELECT Id,(SELECT Name FROM Contacts) FROM Account];
        System.debug(accList);
    }
}