public class Account_Help 
{
 public static void Create_Record(string AccName,string Accphone,string Ratingvalue)
 {
     Account Acc = new Account();
     Acc.Name = AccName;
     Acc.Phone = Accphone;
     Acc.Rating = Ratingvalue;
     insert Acc;
     if(Acc.Id!=null)
         system.debug('Account record Inserted,with Account ID:'+Acc.Id);
 }
}