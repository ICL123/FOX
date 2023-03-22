public class GenericRecordCreationEngine implements Schedulable {
    Public void execute(SchedulableContext context) {
        string jsonString = '{"JSON" : {"LastName" : "Nagaonkar","Email" : "heena@eternussolutions.com"},"ObjectName" : "Contact"}';
        Map<String, Object> jsonObject = (Map<String, Object>) JSON.deserializeUntyped(jsonString);
        Map<String, Object> fields = (Map<String, Object>) jsonObject.get('JSON');
        
        if (jsonObject.get('ObjectName') == 'Contact') {
            Contact acct = new Contact(LastName = (String)fields.get('LastName'), Email = (String)fields.get('Email'));
            insert acct;
        }
    }

    /*public static void runSchedule() {

            String cron_exp = '0 20 * * * ?';
            GenericRecordCreationEngine gen = new GenericRecordCreationEngine();
            System.schedule('Batch apex to run every hour', cron_exp, gen);
    }*/
}