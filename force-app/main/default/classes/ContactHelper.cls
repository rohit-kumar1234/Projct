public class ContactHelper 
{
	public static void CountConsForAcc(list<Contact> lst_con)
    {
        set<ID> accId = new set<ID>();
       /*
         * get Account id's from list of contacts and add then to set which holds Account id's.
         */
        for(contact con:lst_con)
        {
            if(con.AccountId != null || con.AccountId !='')
            {
                accId.add(con.AccountId);
            }
            
        }
        /*
         * Fetch the Accounts with the id's in accId
         */
        
        if(!accId.isempty())
        {
          list<Account> lst_Acc = [select id,No_of_Contacts__c,(select id,name from contacts) from  account where id in:accId];
            for(Account Acc:lst_Acc)
            {
                //Assign No_of_Contacts__c with count of Contacts for this Account.
				Acc.No_of_Contacts__c = Acc.Contacts.size();                
            }
            update lst_Acc;
  		}
       }
    
    public static void NoOfConsForAccAfterDel(list<contact> con_lst)
    {
        set<Id> accid =new set<Id>();
        for(contact con : con_lst)
        {
            accid.add(con.AccountId);
        }
        list<Account> lst_acc=[select id,name,No_of_Contacts__c,(select id,name from Contacts) from Account where id in :accid];
        for(Account Acc:lst_acc)
        {
            Acc.No_of_Contacts__c = acc.contacts.size();
        }
        update lst_acc;
    }
    
    public static void updtconCountForAcc(map<Id,Contact> oldMap  , map<Id,Contact> newMap)
    {
        //fetch the ids of the contacts which needs to update..
        //can take oldmap or newmap b/c 1)records which r to update r stored in oldmap 2)updated records r stored in newmap
        set<id> conids = newMap.keyset();
        
        //list<Contact> con_lst = [select id,AccountId from contact where id in :conids];
        //An empty set to store ids of contact.AccountId field
        set<Id> accids = new set<Id>();
        
        for(Id k : conids)
        {
            //fetch the contact from oldmap i.e record which is to be updated using the contact id(ex contactid--001)
            Contact oldcon = oldMap.get(k);
            
            //fetch the contact from newmap i.e record with updated values using the contact id(ex contactid--001)
            contact newcon = newMap.get(k);
            
            //now compare values of both records AcountId,if both records AccountId didnt match 
            //then on that contact(ex contactId--001) AccountId is changed/updated
            if(oldcon.AccountId != newcon.AccountId)
            {
                //fetch the AccountId from oldmap & newmap using the respective old & new Contact
                //Add the AccountId to the Set<Id>
                accids.add(oldcon.AccountId);
                accids.add(newcon.AccountId);
                
            }
            
            //fetch the Accounts Along with Contacts using Set<Id>
            list<Account> AccToUpdt = [select id,name,(select id,name from contacts) from Account where id in :accids];
            
            //loop through the Account list And update No_of_Contacts__c field value with contact size i.e no of related cons
            for(Account Acc : AccToUpdt)
            {
                Acc.No_of_Contacts__c = Acc.contacts.size();
            }
            update AccToUpdt;
        }
    }
    
    public static void restrictConForAcc(list<Contact> lst_con)
    {
        set<Id> accids = new set<Id>();
        for(contact con : lst_con)
        {
            accids.add(con.AccountId);
        }
        list<Account> Acclst = [select id,name,(select id,name from contacts) from account where id in :accids];
        for(Account acc : Acclst)
        {
            if(acc.contacts.size() >= 3)
            {
                acc.adderror('cannot have more than 3 contacts for an account');
            }
           
        }
    }
}