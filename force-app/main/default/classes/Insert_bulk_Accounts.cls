public class Insert_bulk_Accounts 
{
    public static void insertBulk()
    {
        integer i;
        integer j;
        list<Account> Acc_lst = new list<Account>();
        for(j=1;j<=5;j++)
        {
            for(i=1;i<=10000;i++)
        	{
            	 Account Acc = new Account();
            	 Acc.Name = 'bulk'+(i*.01);
           		 Acc.Phone='666';
           		 Acc_lst.add(acc);
        	}
         	Database.insert(Acc_lst, False);
        }
       system.debug('ur insertion is completed');
        }
    
}