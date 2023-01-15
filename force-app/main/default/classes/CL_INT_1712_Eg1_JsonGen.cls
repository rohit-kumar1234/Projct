public class CL_INT_1712_Eg1_JsonGen 
{
    public void createJson(String nm,string ph, string Ind)
    {
        system.JSONGenerator js = json.createGenerator(true); // step1:- create json generator
        js.writeStartObject();                                // step2:- start writing to json
          try
          {
              Account a = new Account();
              a.Name = nm;
              a.Phone = ph;
              a.Industry = Ind;
              
              insert a;
              
              js.writeStringField('status','success');        //step3: write JSOn as per requirement
              js.writeIdField('accId',a.Id);
              js.writeStringField('MSG','Account created succsfully');
              js.writeNumberField('code',100);
          }
          catch(exception e)
          {
              js.writeStringField('status','Failure');
              //js.writeIdField('accId',a.Id);
              js.writeStringField('MSG',e.getMessage());
              js.writeNumberField('code',200);
          }
        js.writeEndObject();                                  // step4: End writing to Json
        string result = js.getAsString();                     // step5: get final output json
        system.debug(result);                                     // step6: see/check the output
        
    }
}