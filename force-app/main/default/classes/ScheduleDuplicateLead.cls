global class ScheduleDuplicateLead implements Schedulable {
    public void execute(SchedulableContext sc) {
        Database.executeBatch(new DuplicateLeadBatch());
    }

}