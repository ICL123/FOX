public class LeadRecord {
    public static void leadStatus() {
    	List<AggregateResult> leadList =[SELECT  COUNT(Id) Id, LeadSource, Status FROM Lead GROUP BY LeadSource, Status]; 
        List<Lead> lList=[SELECT Id, Name, LeadSource, Status FROM Lead];
        
    	Map<string,map<string,integer>> leadMap = new map<string,map<string,integer>>(); 
        Map<String,Integer> ldMap=new Map<String,Integer>();
        
		for(AggregateResult  l :leadList) {
            if(leadMap.containsKey((String)(l.get('Status'))) == false) {
                ldMap.clear();
            }
            
            ldMap.put((String)l.get('LeadSource'),(Integer)l.get('Id'));
            
            leadMap.put((String)l.get('Status'),ldMap);
            
		}
        System.debug(leadMap);
	}
}