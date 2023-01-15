public class dm2 
{
    public  integer x = 10;
    public static void dem1(integer y)
    {
       y= 10;
      system.debug(y);
   }
    public static void dem2(integer y)
    {
        dm2 d = new dm2();
         system.debug(d.x);
    }
    public static void dem3()
    {
        integer y = 15;
        system.debug(y);
    }
}