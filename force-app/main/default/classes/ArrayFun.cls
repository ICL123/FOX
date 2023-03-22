public class ArrayFun
{
    public void printArray(Integer[] intArray){
        System.debug('Array elements:');
       	for(Integer i=0;i<intArray.size();i++)
          	System.debug(intArray[i]);
    }
    public static void main() {
        ArrayFun a=new ArrayFun();
        Integer[] intArray = new List<Integer>{12,21,32,4,33};
        a.printArray(intArray);
    }
}