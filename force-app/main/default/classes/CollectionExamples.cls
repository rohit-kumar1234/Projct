public class CollectionExamples
{
 	string str;
    integer intr;
    list<Account> Acc_lst = [select id,name,OwnerId,
                            (select id,name,Accountid from contacts) 
                            from Account];
    map<id,list<Account>> map_Acc_lst= new Map<id,list<Account>>();
    
    
    
}