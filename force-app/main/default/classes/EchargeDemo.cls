public class EchargeDemo {
	public static string str1 = 'strring';
    private string st = 'hi all';
    public static void methodDemo(){
         string sqt = 'all';
       // list<Account> lstAcc = [select id,name from Account];
        //system.debug(lstAcc);
        system.debug(str1);
        system.debug(sqt);
        EchargeDemo ec = new EchargeDemo();
        ec.privateMethod();
        system.debug(ec.st);
        
    }
    
    private void privateMethod(){
         system.debug('lstAcc');
        //methodDemo();
    }
}