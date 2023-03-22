public class LeadCount {
    public static void countLeadRecord() {
        List<AggregateResult> leadList=[SELECT LeadSource, COUNT(Name) FROM Lead GROUP BY LeadSource];
        System.debug(leadList);
    }
}