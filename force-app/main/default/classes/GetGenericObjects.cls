public with sharing class GetGenericObjects {
    @AuraEnabled (cacheable=true)
    public static List<EntityDefinition> retreieveObjects(){
        return [SELECT Id, MasterLabel,  
                DeveloperName, 
                QualifiedApiName 
                FROM EntityDefinition 
                WHERE IsApexTriggerable = true And DeveloperName In ('Lead', 'Account', 'Case')
                ORDER BY MasterLabel
               ];
    }
    
    
    @AuraEnabled(cacheable = true)
    public static String allRecord(String objectApiNames, String fieldsetName) {
        Map<String, String> returnMap = new Map<String,String>();
        if(!String.isEmpty(objectApiNames) && !String.isEmpty(fieldsetName)) {
            //get fields from FieldSet
            SObject sObj = (SObject)(Type.forName('Schema.'+ objectApiNames).newInstance());
            List<Schema.FieldSetMember> lstFSMember = 
                sObj.getSObjectType().getDescribe().fieldSets.getMap().get(fieldsetName).getFields();
            
            //prepare SOQL query based on fieldAPIs	
            String query = 'SELECT ';
            for(Schema.FieldSetMember f : lstFSMember) {
                query += f.getFieldPath() + ', ';
            }
            query += 'Id FROM ' + objectApiNames;
            
            // //Just in case criteria field not specified then it will return all records
            // if(!(String.isEmpty(criteriaField) && String.isEmpty(criteriaFieldValue))){
            //     query += ' WHERE ' + criteriaField + '=\'' + criteriaFieldValue + '\'';
            // }
            
            //execute query
            List<SObject> lstRecords = Database.query(query);
            
            //prepare a map which will hold fieldList and recordList and return it
            returnMap.put('FIELD_LIST', JSON.serialize(lstFSMember));
            returnMap.put('RECORD_LIST', JSON.serialize(lstRecords));
            return JSON.serialize(returnMap);
        }
        return null;
    }
    
    //Retrieve field details based on Object API Name
    @AuraEnabled (cacheable = true)
    public static String getListOfFields(String objectAPIName){
        Map<String, String> fieldList = new Map<String, String>();
        if(!String.isEmpty(objectAPIName)){
            Map<String, String> mapField = new Map<String, String>();
            Map<String, SObjectField> lstFields = 
                schema.getGlobalDescribe().get(objectAPIName).getDescribe().fields.getMap();
            
            for(String str: lstFields.keySet()){
                mapField.put(str, lstFields.get(str).getDescribe().getLabel());                
            }
            System.debug(System.JSON.serializePretty(mapField));
            return System.JSON.serializePretty(mapField);
        }
        return null;
    }
    
    
    //Retrieve records based on selected fields and object.
    @AuraEnabled (cacheable = true)
    public static List<SObject> retreieveRecords(String objectName, String fieldAPINames,String soId){
        String strQuery = 'SELECT ' + String.escapeSingleQuotes(fieldAPINames) 
            + ' FROM ' + String.escapeSingleQuotes(objectName);
        return System.database.query(strQuery);
    }
}