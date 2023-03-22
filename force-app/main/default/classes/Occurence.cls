public class Occurence {
	public static void countItems(List<Integer> arr) {
        //{2,2,3,4,2,4,5}
        arr.sort();
    	List<Integer> itemCount = new List<Integer>();
    	Integer counter = 0;
    	Integer lastItem = arr[0];

    	for(Integer i = 0; i < arr.size(); i++) {
            counter=1;
            for(Integer j = i + 1; j <arr.size(); j++)
        	if(arr[i] == arr[j])
        	{
            	counter++;
        	}
        	else
        	{
            	break;
        	}
        	if(counter >= 1)
            {
                System.debug(arr[i]+' : '+counter);
                i = i + counter-1;
            }
    	}
	}

	public static void main()
	{
    	List<Integer> array1 = new List<Integer>{2,2,3,4,2,0,4,5,0};
    	countItems(array1);
	}
}