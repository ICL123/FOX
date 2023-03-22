public class LeadSrc {
    public static void leadStatus() {
    	List<Lead> leads =[Select  Id, LeadSource, Name, Status from Lead] ; 
		map<string,map<string,integer>> leadMap = new map<string,map<string,integer>>(); 
		for(Lead  l :leads) {
    		if(leadMap.containsKey(l.LeadSource)) {
        		map<string,integer> leadMap1 = leadMap.get(l.LeadSource);
        		Integer val = leadMap1.get(l.LeadSource) ; 
        		val++ ; 
        		leadMap1.put(l.Status ,val) ;
        		leadMap.put(l.LeadSource , leadMap1);
    		} 
        	else {
        	Map<String,Integer>  m = new Map<String,Integer>(); 
        	m.put(l.LeadSource,1);
        	leadMap.put(l.LeadSource,m);
    		}	 
		}
        System.debug(leadMap);
	}
}