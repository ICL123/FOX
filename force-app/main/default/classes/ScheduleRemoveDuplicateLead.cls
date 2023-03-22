public class ScheduleRemoveDuplicateLead implements Schedulable {
    public void execute(SchedulableContext sc) {
        Database.executeBatch(new RemoveDuplicateLeadBatch());
    }	
}