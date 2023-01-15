public with sharing class dataTableHelper {
    @AuraEnabled(cacheable=true)
    public static list<Account> fetchAccounts(){
        return [select id,name,AnnualRevenue,Industry,Phone from Account];
    }
}
