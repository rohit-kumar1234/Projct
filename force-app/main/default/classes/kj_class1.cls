public class kj_class1 {
    public static list<Account> cream(){
        list<account> lstAcc = new list<account>();
        list<contact> lstCon = new list<contact>();
        for(integer i=0;i<5;i++){
            account acc =new account();
            acc.name = 'acc'+i;
            
            lstAcc.add(acc);
            contact con  = new contact();
            con.AccountId = acc.id;
            con.LastName = 'con'+i;
            lstCon.add(con);
        }
        system.debug(lstAcc);
        system.debug(lstCon);
        
        return lstAcc;
    }
}