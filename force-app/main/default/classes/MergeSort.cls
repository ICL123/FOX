public class MergeSort
{
	public static void mergeArray(Integer[] arr, Integer l, Integer m, Integer r)
	{
		Integer n1 = m - l + 1;
		Integer n2 = r - m;
		Integer[] L1 = new Integer [n1];
		Integer[] R1 = new Integer [n2];

		for (Integer i=0; i<n1; ++i)
			L1[i] = arr[l + i];
		for (Integer j=0; j<n2; ++j)
			R1[j] = arr[m + 1+ j];

        Integer i = 0, j = 0;

		Integer k = l;
		while (i < n1 && j < n2)
		{
			if (L1[i] <= R1[j])
			{
				arr[k] = L1[i];
				i++;
			}
			else
			{
				arr[k] = R1[j];
				j++;
			}
			k++;
		}

		while (i < n1)
		{
			arr[k] = L1[i];
			i++;
			k++;
		}

		while (j < n2)
		{
			arr[k] = R1[j];
			j++;
			k++;
		}
	}

	public static void sortArray(Integer[] arr, Integer l, Integer r)
	{
		if (l < r)
		{
			Integer m = (l+r)/2;

			sortArray(arr, l, m);
			sortArray(arr , m+1, r);

			mergeArray(arr, l, m, r);
		}
	}

	static void printArray(Integer[] arr)
	{
		Integer n = arr.size();
        for (Integer i=0; i<n; ++i) {
			System.debug(arr[i] +' ');
        }
	}

	public static void main()
	{
		Integer[] arr = new Integer[]{2, 81, 23, 55, 16, 4};

		sortArray(arr, 0, arr.size() - 1);

		System.debug('Sorted array');
		printArray(arr);
	}
}