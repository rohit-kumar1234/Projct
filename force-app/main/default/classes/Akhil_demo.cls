public class Akhil_demo {
   
    public  void list_examples()
    {
        list<object> intLst = new list<object>();
        intLst.add(10);
		intLst.add('10');        
    	system.debug(intLst);
    	system.debug(intLst.size());
	}
    public static void lst1(){
        integer a = Akhil_wrapper.inta;
        a = 1000;
        
        system.debug('ok'+a);
    }
    public static void qwerty()
    {
       /* //system.debug(Akhil_wrapper.inta);
        integer a1 = 20;
        integer b1 = 25;
        integer c1=b1;//25
        integer d1=c1;//25
        system.debug(a1);//20
        system.debug(b1);//25
        system.debug(c1);//25
        system.debug(d1);//25
        c1=101;
        system.debug(d1);//25
        system.debug(c1);//101*/
        
        list <integer> lsta =new list<integer>();
        system.debug('this is lst  '+lsta.size());
        lsta.add(45);//0
        lsta.add(5);lsta.add(25);
        system.debug(lsta.size()+'     '+lsta);
        list<object> lst_obj = lsta;
        lst_obj.add(116
                   );
        system.debug(lsta);
         system.debug(lst_obj+'i am obj list');
        
    }
    
}