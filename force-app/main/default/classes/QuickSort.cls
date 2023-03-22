public class QuickSort{
	public static void swap(Integer[] arr, Integer i, Integer j) {
		Integer temp = arr[i];
		arr[i] = arr[j];
		arr[j] = temp;
	}

	static Integer partition(Integer[] arr, Integer low, Integer high) {
		Integer pivot = arr[high];
		Integer i = (low - 1);

		for(Integer j = low; j <= high - 1; j++) {
			if (arr[j] < pivot)
			{
                i++;
				swap(arr, i, j);
			}
		}
		swap(arr, i + 1, high);
		return (i + 1);
	}

	static void quickSort(Integer[] arr, Integer low, Integer high)
	{
		if (low < high)
		{
		
			Integer pi = partition(arr, low, high);
			quickSort(arr, low, pi - 1);
			quickSort(arr, pi + 1, high);
		}
	}
    
	public static void printArray(Integer[] arr, Integer size)
	{
		for(Integer i = 0; i < size; i++)
			System.debug(arr[i] + ' ');
	}


	public static void main()
	{
		Integer[] arr = new Integer[]{10, 7, 8, 9, 1, 5};
		Integer n = arr.size();
	
		quickSort(arr, 0, n - 1);
		System.debug('Sorted array: ');
		printArray(arr, n);
	}
}