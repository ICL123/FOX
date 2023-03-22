public class MapRecord {
    public static void checkMap() {
        Map<String, String> newMap= new Map<String, String>();
        newMap.put('abc','Pune');
        newMap.put('abc','Mumbai');
        newMap.put('abc','Nagpur');
        
        System.debug(newMap);
    }
}