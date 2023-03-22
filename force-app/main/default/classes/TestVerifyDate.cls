@isTest public class TestVerifyDate {
    @isTest static void testVerifyDateTodayPlus29() {
        Date date1 = date.today();
        Date date2 = date1.addDays(29);
        Date dat = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2, dat);       
	} 
    
        @isTest static void testVerifyDateTodayPlus31() {
        Date date1 = date.today();
        Date date2 = date1.addDays(31);
		Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
		Date lastDay1 = Date.newInstance(date1.year(), date1.month(), totalDays);    
        Date dat = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(lastDay1, dat);       
	}
}