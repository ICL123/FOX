public Class ContactAndLeadSearch
{
        public static List<List<sObject>> searchContactsAndLeads(String LastName)
        {
            List<List<sObject>> conList=[FIND: LastName IN ALL FIELDS RETURNING Contact(Name),Lead(Name)];
            return conList;
        }
}