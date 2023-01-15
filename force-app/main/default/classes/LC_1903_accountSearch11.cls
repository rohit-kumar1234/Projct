public class LC_1903_accountSearch11 {
    @AuraEnabled
    public static List<Account> lstAccRecords(string searchtext)
    {
        //list<account> lst_acc = new list<account>();
        
        string qry = 'select Id,Name,Phone,Industry,Rating from account where Name like \'%'+ searchtext +'%\'' ;
        list<Account> lst_acc  = Database.query(qry);
        return lst_acc;
    }

}