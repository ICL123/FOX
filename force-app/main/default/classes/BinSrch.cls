public class BinSrch {
    public static void binarySearch(List<integer> search1, Integer left, Integer right, Integer num) {
        List<Integer> srch=search1;
        Integer mid=(left+right)/2;
        while(left<=right)
        {            
            if(srch[mid]==num)
            {
                System.debug('Number found at :'+mid+' location');
                break;
            }
            else if(srch[mid]<num)
            {
                left=mid+1;
            }    
            else
            {
                right=mid-1;
            }
                
            mid=(left+right)/2;
        }
    }		
    public static void main(){
        List<Integer> srch = new List<Integer>();
        srch.sort();
        System.debug('Sorted array : '+srch);
        Integer right = srch.size() - 1;
        Integer n;
        binarySearch(srch,0,right,n);
    }
}