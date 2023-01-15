public class OppLineItem {
	@AuraEnabled
    public static string createRecord(list<OpportunityLineItem> listofLineItem,string prodId , string oppId)
    {	
        list<OpportunityLineItem> opl_lst = new list<OpportunityLineItem>();
        for(OpportunityLineItem op : listofLineItem ){
            OpportunityLineItem oli  = new opportunityLineItem();
        oli.PricebookEntryId = [select id,name from PriceBookEntry where Product2Id  =:prodId  and Pricebook2.Name ='India Price book' limit 1].id;
        oli.OpportunityId =oppid;//'0065j00000kNPQnAAO' ;  Product2Id  ='01t5j000003U1LnAAK'
        oli.Quantity = op.Quantity;
            oli.Description = op.Description;
        oli.UnitPrice = op.UnitPrice;
            //oli.TotalPrice=op.TotalPrice;
            opl_lst.add(oli);
        }
        insert opl_lst;
      /*  priceBookEntry pbe = new priceBookEntry();
        pbe.Pricebook2Id=[select id,name from priceBook2 where name ='Standard' limit 1 ].id;
        pbe.Product2Id ='01t5j000003U1LkAAK';
       		//insert pbe;*/
       	//0065j00000kNPThAAO   /=== 01t5j000003U1LkAAK
      // string prodtId= (string) JSON.deserialize(prodId, string.class);
				//system.debug(prodtId);
      /*  OpportunityLineItem oli  = new opportunityLineItem();
        oli.PricebookEntryId = [select id,name from PriceBookEntry where Product2Id  =:prodId  and Pricebook2.Name ='India Price book' limit 1].id;
        oli.OpportunityId =oppid;//'0065j00000kNPQnAAO' ;  Product2Id  ='01t5j000003U1LnAAK'
        oli.Quantity = 1;
        oli.UnitPrice = 500;
        //oli.TotalPrice  = 1*500;
        insert oli; */
        return 'success';
    }
}