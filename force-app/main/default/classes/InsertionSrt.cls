public class InsertionSrt {
	public static void sortArray(List<Integer> arr) {
		integer n = arr.size();
		for (integer i = 1; i < n; i++) {
			integer key = arr[i];
			integer j = i-1;

			while(j> = 0 && arr[j] > key) {
				arr[j+1] = arr[j];
				j = j - 1;
			}
			arr[j+1] = key;
		}
	}

	public static void printArray(List<Integer> arr) {
		integer n = arr.size();
		for (integer i = 0; i < n; ++i)
			System.debug(arr[i] +' ');
	}
    
	public static void main() {
		List<Integer> arr = new List<Integer>{12, 11, 13, 5, 6};
		sortArray(arr);
		printArray(arr);
	}
}