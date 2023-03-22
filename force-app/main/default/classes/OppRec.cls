public class OppRec {
      Public static Void displayRec() {
       List<Opportunity> opportunityList = new List<Opportunity>();
       opportunityList = [Select Id, Name, Amount From opportunity where Amount >= 10000 AND (isDeleted =: true OR isDeleted =: false)  
                          ORDER BY CreatedDate DESC LIMIT 100 OFFSET 50 ALL ROWS];
       System.debug(opportunityList);
    }
}