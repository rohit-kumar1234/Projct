public with sharing class jsonToFile {
    public static string  sjsonTo(string jsonStr) {
        ContentVersion cv =new ContentVersion();

        cv.VersionData=EncodingUtil.base64Decode(jsonStr);
        //cv.VersionData = Blob.valueOf(JSON.serialize(jsonStr));
		//conVer.VersionData = EncodingUtil.base64Decode(yourFilesContent);// converting your binary string to Blog 
        cv.pathOnClient = 'ConvertedJson.txt';
        cv.Title = 'CvrtdJson';
        cv.ContentLocation = 's';
        insert cv;

        id conDoc =[select ContentDocumentId from contentVersion where id=:cv.id].ContentDocumentId;

        ContentDocumentLink cdl = new ContentDocumentLink();
        cdl.LinkedEntityId = '0015j00000DyZHZAA3';
        cdl.ContentDocumentId = conDoc;
        cdl.ShareType = 'V';
        insert cdl;
        string strIds = 'ContentVersion Id is :'+cv.id +'ContentDocumentLink id is :'+cdl.id;
        return strIds;
    }
}