public class pdfGenHandler {
	@AuraEnabled
    public static string attatchPdf(string oppRecId){
        pageReference page = page.pdfGenDemo;
        page.getParameters().put('oppId',oppRecId);
        
        Opportunity opp = [select id,name from Opportunity where Id = :oppRecId limit 1];
        system.debug('opp is'+opp);
        Attachment att = new Attachment();
        	att.Name = opp.Name+'.pdf';
        	att.ParentId = opp.Id;
        	att.Body = page.getContentAsPDF();
        	att.IsPrivate = false;
        insert att;
        system.debug(att.Id);
        return 'Successfully attached a pdf for opportunity'  ;
    }
}