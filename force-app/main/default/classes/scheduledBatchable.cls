global class scheduledBatchable implements Schedulable {
   global void execute(SchedulableContext sc) {
      DuplicateLeadBatch b = new DuplicateLeadBatch(); 
      database.executebatch(b);
   }
}