public class MultiLevelRelation {
    public static void main(){
		List<D__c> usre3=[select id,name,C__r.name,C__r.B__r.name from D__c];
		system.debug('Child : '+usre3[0].name);	
		system.debug('Parent : '+usre3[0].C__r.name);
		system.debug('Grand Parent : '+usre3[0].C__r.B__r.name);
    }
}