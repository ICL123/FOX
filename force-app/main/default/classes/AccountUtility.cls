public class AccountUtility {
	public static void viewAnnualRevenue()
    {
        List<Account> accountsList=[SELECT Name,	AnnualRevenue From Account];
        for(Account acc:accountsList)
        {
            String acctRev='Account Name:'+acc.Name+':Annual Revenue:'+acc.AnnualRevenue;
            System.debug(acctRev);
        }
    }
}