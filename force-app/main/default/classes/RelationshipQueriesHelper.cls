public class RelationshipQueriesHelper 
{
   public static void GetAccountRelatedRecords(string AccountName)
   {
       if(AccountName != Null && AccountName !='')
       {
         List<account> lstacc = [select id,name,rating,
                                  (select id,firstname,lastname,email from contacts),
                                  (select id,name,amount,closedate,stagename from opportunities),
                                  (select id,casenumber,origin,status,priority from cases)
                                 From Account
                                 where name=:AccountName];
         // system.debug(lstacc);
       
          if(!lstacc.isempty())
          {
              for(account acc:lstacc)
              {
                  system.debug('Account id is---:'+acc.id);
                  system.debug('Account name is---:'+acc.name);
                  system.debug('Account rating is---:'+acc.rating);
                  
                  system.debug('--------number of contacts with account------'+acc.contacts.size());
                  for(contact con: acc.contacts)
                  {
                      system.debug('contact record is -------:'+con);
                  }
                  system.debug('--------number of opportunities with account------'+acc.opportunities.size());
                  for(opportunity opp : acc.opportunities)
                  {
                      system.debug('Opportunity record is --------'+opp);
                  }
                  system.debug('--------number cases for this account is------'+acc.cases.size());
                  for(case cs: acc.cases)
                  {
                      system.debug('Case record is ----------'+cs);
                  }
              }
          }
           system.debug('number of SOQL queries used-----:'+system.Limits.getQueries());
       }
   }
}