public class AccountTriggerHandler {
    
    private static boolean run = true;
    
    public static boolean runonce(){
        if (run) {
            run=false;
            return true;
        }
        else {
            return run;
        }
    }
}