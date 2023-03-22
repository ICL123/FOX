public class BubbleSort {
   public static void sortArray() {
       integer temp;
       List<integer> intlist = new List<Integer>{36,19,29,12,5};
           for(integer i = 0; i < intlist.size(); i++){
               integer flag = 0;
               for(integer j = 0; j < intlist.size() - 1 - i; j++){
                   if(intlist[j] > intlist[j+1]) {
                       temp = intlist[j];
                       intlist[j] = intlist[j+1];
                       intlist[j+1] = temp;
                       flag = 1;
                   }
               }
               if(flag == 0) {
                   break;  
               }
           }
       for(integer i = 0; i < intlist.size(); i++) {
           System.debug(intlist[i]);
       }
   }
}