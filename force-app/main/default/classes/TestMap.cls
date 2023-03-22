public class TestMap {
    public static void main(){
		Map<Integer, String> m1 = new Map<Integer, String>();
		m1.put(1, 'First item');
		m1.put(1, 'Second item');
    	System.debug(m1);
    }
}