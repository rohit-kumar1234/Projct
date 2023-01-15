Global class BulkAccountHelper implements Database.Batchable<sObject>
{
	Global Database.QueryLocator start(Database.BatchableContext bc)
    {
       return Database.getQueryLocator('select id, name , phone from Account where name LIKE \'445\''); 
    }
    Global void execute(Database.BatchableContext bc,list<Account> lstAcc)
    {
        delete lstAcc;
    }
    Global void finish(Database.BatchableContext bc)
    {
        AsyncApexjob jobDetails = [select id,status,TotalJobItems,JobitemsProcessed,NumberOfErrors,createdby.Email 
                                   from AsyncApexjob
                                   where Id=:bc.getJobId()];
        /*system.debug('Id is :'+jobDetails.Id +'---Status :'+jobDetails.status+'---TotalJobItems :'+jobDetails.TotaljobItems+
                     '---JobItemsprocessed :'+jobDetails.JobItemsProcessed +'---Numberoferrors :'+jobDetails.NumberOfErrors +
                     '---createdby.email :'+jobDetails.createdby.Email); */
    }
}