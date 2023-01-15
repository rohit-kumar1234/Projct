public class List_Examples 
{
 public static void All_Lists()
 {
    List<string> str1 = new list<string>();
    list<string> str2  = new list<string>();
     // add elements to str1
          str1.Add('virat'); 
           str1.Add('rohit');    
      str1.Add('pant');    
      str1.Add('rahul');    
      str1.Add('buvi');    
     
     system.debug(str1);
     
    // add elements to str2
          str2.Add('shami');    
      str2.Add('shardul');    
      str2.Add('iyer'); 
     str2.Add(1,'kuldeep');
  
     system.debug(str2);
     
     list<string> str3 = new list<string>();
     str3.Addall(str2);
     str3.addall(str1);
     system.debug(str3);
     
    List<integer> int1 = new list<integer>();
    list<object> objt1  = new list<object>();
 }
  public static void Add_Elements()
  {
  }
}