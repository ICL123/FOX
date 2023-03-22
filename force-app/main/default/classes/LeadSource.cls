public class LeadSource {
    public static void countLeadSource() {
        List<sObject> leadList = [SELECT LeadSource, Count(Name) FROM Lead GROUP BY LeadSource HAVING COUNT(Name) > 10];
        System.debug(leadList);
    }
}