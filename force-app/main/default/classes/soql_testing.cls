public class soql_testing 
{
   public static void GetAllAccounts()
   {
    list<account> lst_acc =[select id , name ,rating ,industry from account];
     system.debug(lst_acc);
   }
}