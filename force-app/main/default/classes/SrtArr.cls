public class SrtArr {
    public static void mathOperations(List<Integer> arrayelements) {
        //List<Integer> arr=new List<Integer>{30,20,10,40};
        List<Integer> arr = arrayelements;
    	Integer temp = 0;
    	for(Integer i = 0; i < arr.size(); i++)
    	{
        	for(Integer j = i + 1; j < arr.size(); j++)
        	{
            	if(arr[i] > arr[j])
            	{
                	temp = arr[i];
             		arr[i] = arr[j];
                	arr[j] = temp;
            	}
        	}
    	}
        System.debug('Array in ascending order : '+arr);
        
        for(Integer i = 0; i < arr.size(); i++) {
        	for(Integer j = i + 1; j < arr.size(); j++) {
            	if(arr[i] < arr[j])
            	{
                	temp = arr[i];
             		arr[i] = arr[j];
                	arr[j] = temp;
            	}
        	}
    	}
        System.debug('Array in descending order : '+arr); 
        
        temp = arr[0];
        for(Integer i = 0; i < arr.size(); i++)
        {
            if(temp < arr[i])
                temp = arr[i];
        }
        System.debug('Maximum element in an array : '+temp);
        
        for(Integer i = 0; i < arr.size(); i++)
        {
            if(temp > arr[i])
                temp = arr[i];
        }
        System.debug('Minimum element in an array : '+temp);
       
    }
}