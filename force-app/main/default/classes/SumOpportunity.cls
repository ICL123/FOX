public class SumOpportunity {
    public static void calculateAmount() {
    List<sObject> opportunityList = [SELECT  SUM(Amount), CALENDAR_YEAR(CreatedDate) FROM Opportunity  
                         Group by  CALENDAR_YEAR(CreatedDate)] ;
        
	Map<Integer, Decimal> sumtoYear = new Map<Integer, Decimal>() ;
	for(sObject a :opportunityList){
    	sumtoYear.put((Integer)a.get('expr1'), (Decimal) a.get('expr0'))  ; 
	}
	System.debug('Sum'+sumtoYear);
    }
}