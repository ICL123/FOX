public class InsertionSort{
   public static void insertionSortMethod() {
       list<integer> inList = new list<integer>{5,1,6,2,4,3};
       integer temp;
       integer j;
       for(integer i = 0; i < inlist.size(); i++){
           temp = inlist[i];
           j=i;
           while(j > 0 && inlist[j-1] > temp){
               inlist[j] = inlist[j-1];
               j = j-1;
           }
           inlist[j] = temp;
       }
       System.debug(inlist);
   }
 
}