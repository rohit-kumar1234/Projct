public class LA_1903_insertAcc_RetrieveAllRecords 
{
    @AuraEnabled
    public static string insertAcc(Account Acc)
    {
        string res;
        try
        {
            insert Acc;
            res = 'Insert Successful';
            
        }
        catch(exception e)
        {
           res = 'Failed'; 
           
        }
        return res;
        
    }
     @AuraEnabled
     public static list<Account> All_Accounts()
    {
        list<account> all_acc = [select id,Name,Phone,Rating 
                                 from Account];
        return all_acc;
       // system.debug(all_acc);
    }
}