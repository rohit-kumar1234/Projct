public with sharing class CarController {
    //create a wrapper class
  
    public class ValuesObj {
        @AuraEnabled
        public String searchValue {get;set;}
        @AuraEnabled
        public Decimal sliderValue {get;set;}     
        @AuraEnabled
        public String[] categories {get;set;}
        @AuraEnabled
        public String[] makeType {get;set;}
    }
    @AuraEnabled(Cacheable=true)
    public static List<Car__c> getCars(ValuesObj values){
        string search,whereClause='';
        Decimal maxPrice;
        string[] categories,makeType,searchCriteria=new list<string>{};

        if(values !=null){
            maxPrice=values.sliderValue;
            makeType=values.makeType;
            categories=values.categories;
            //check if string is blank..if not then add the string to the searchCriteria 
            if(string.isNotBlank(values.searchValue)){
                search='%'+values.searchValue+'%';
                searchCriteria.add('Name LIKE:search');
            }
            // add maxprice to criteria
            if(values.sliderValue>=0){
                searchCriteria.add('MSRP__c<=:maxPrice');
            }
            //category field
            if(values.categories!=null){
                searchCriteria.add('Category__c IN :categories');
            }
            //maketype field
            if(values.makeType!=null){
                searchCriteria.add('Make__c IN:makeType');
            }
            //add string to whereClause
            if(searchCriteria.size()>0){
                whereClause='Where '+string.join(searchCriteria,'AND');
            }

            
        }
        //system.debug(search+'-'+whereClause+'-'+maxPrice+'-'+categories);
        // return [Select id,name,Category__c,Make__c,MSRP__c,Description__c,Picture_URL__c from Car__c];
        String queryrecords='SELECT Id,Name,MSRP__c,Description__c,Category__c,Picture_URL__c FROM Car__c '+ whereClause+' with SECURITY_ENFORCED Order By Name';
        return Database.query(queryrecords);
    }
    
   /* public static List<Car__c> getCars(Filters filters){
        String key, whereClause ='';
        Decimal maxPrice;
        String[] categories, makeType, criteria = new List<String>{};
        if(filters !=null){
            maxPrice = filters.maxPrice;
            categories = filters.categories;
            makeType = filters.makeType;
            if(!String.isEmpty(filters.searchKey)){
                key = '%'+filters.searchKey + '%';
                criteria.add('Name LIKE: key');
            }
            if(filters.maxPrice >= 0){
                criteria.add('MSRP__c <= :maxPrice');
            }
            if(filters.categories != null){
                criteria.add('Category__c IN :categories');
            }
            if(filters.makeType != null){
                criteria.add('Make__c IN :makeType');
            }
            if(criteria.size()>0){
                whereClause =  'WHERE ' + String.join(criteria, ' AND ');
            }
        }
        String query = 'SELECT Id, Name, MSRP__c, Description__c,Category__c, Picture_URL__c FROM Car__c' + whereClause + ' WITH SECURITY_ENFORCED' + ' ORDER BY Name';
        return Database.query(query);
    }*/
}