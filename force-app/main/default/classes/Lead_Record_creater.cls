public class Lead_Record_creater 
{
  public static void create_record(string company,string status,string name)
  {
      Lead led = new Lead();
      led.Company = company;
      led.Status = status;
      led.LastName= name;
      
      insert led;
      if(led.id != null)
          system.debug('record inserted : '+ led.id);
  }
}