public class ScheduleDuplicateLeadBatch implements Schedulable {
	    public void execute(SchedulableContext sc) {
        Database.executeBatch(new RemoveDuplicateLeads());
        }
}