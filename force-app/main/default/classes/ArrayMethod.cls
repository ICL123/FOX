public class ArrayMethod {
	
    public static Integer[] generateArray(Integer n)
    {
        Integer[] arr = new Integer[n];
        
        for(Integer i = 0; i < n; i++)
        {
            arr[i] = i;
        }
       	System.debug(arr);
        return arr;
    }
}