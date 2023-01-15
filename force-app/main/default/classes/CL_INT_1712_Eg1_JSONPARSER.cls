public class CL_INT_1712_Eg1_JSONPARSER
{
    public string JsonString{set;get;}
    public Map<string,object> result{set;get;}
    //public Map<string
    
   public CL_INT_1712_Eg1_JSONPARSER()
   {
       result = new Map<string,object>();
       JsonString = '{"Name":"rohit","Marks":[10,20,30],"city":"hyd"}';
       system.JSONParser jp = Json.createParser(jsonString);
       while(jp.nextToken()!=null)
       {
         result.put(jp.getText(), jp.getCurrentToken());  
       } 
       
   }
}