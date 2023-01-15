public class LC_1803_accreate {
    @AuraEnabled
    public static string createrecord(string nam, string industrie,string phn)
    {
        string result;
        try
        {
            Account acc = new Account();
            acc.Name = nam;
            acc.Phone = phn;
            acc.Industry = industrie;
            insert acc;
            result = 'The Record was Sucessfully inserted with Id :'+acc.id;
        }
        catch(exception e)
        {
          result = 'Account record insertion failed with the following reason :'+e.getMessage(); 
        }
        return result;
    }

}