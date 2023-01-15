global class updAccountsBatchApex implements Database.Batchable<sObject>
{
    Global Database.QueryLocator Start(Database.BatchableContext bc)
        {
        	return Database.getQueryLocator('select id,name,rating,industry,type,CustomerPriority__c from Account');
           
        }
    Global void Execute(Database.BatchableContext bc,list<Account> Acc_lst)
        {
           if(!Acc_lst.isEmpty())
           		{
                    list<Account> temp_acc = new List<Account>();
                	for(Account acc:Acc_lst)
                		{
                            acc.rating = 'Hot';
                            acc.Type = 'High';
                            acc.Industry = 'Manufacturing';
                            acc.CustomerPriority__c = 'Low';
                            temp_acc.add(acc);
            			}
                  	   if(!temp_acc.isempty())
         			   Database.update(temp_acc);
           		}
           
        }
    Global void Finish(Database.BatchableContext bc)
        {
        	AsyncApexjob jobDetails = [select id,status,TotaljobItems,jobItemsProcessed,Numberoferrors,createdby.email 
                                      from AsyncApexjob where id=:bc.getJobId()];
            
        }

}