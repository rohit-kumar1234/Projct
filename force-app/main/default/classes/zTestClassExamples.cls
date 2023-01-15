public  class zTestClassExamples 
{
	public string name;
    public integer age;
    public boolean isMale;
    public boolean flag ;
    
    
    public void test1()
    {
        name = 'prasanth';
        age = 26;
        isMale = True;
    }
    public list<object> test2()
    {
       // name = 'narendar';
        //age =96;
        //isMale = false;  
        list<object> ob = new list<object>{name = 'test12',age  =12 , isMale = false};
        //ob.add(name);
        //ob.add(age);
        //ob.add(isMale);
        return ob;//list<object>{name,age,isMale};
        
    }
    public void test3()
    {
        if(flag == true)
        {
            name = 'one';
            age = 1;
            isMale = true;
        }
        else 
        {
             name = 'two';
            age = 2;
            isMale = false;
        }
    }
    
   
   /* public static void tf()
    {
      list<ContentDocument> cd =  [select id,OwnerId,title from ContentDocument where OwnerId = '0055j000003KPlHAAW' ];
      
        
        for(ContentDocument c: cd)
        {
            c.OwnerId = '0055j0000031mkJAAQ';
        }//OwnerId ='0055j0000031mkJAAQ'
        update cd; 
        list<ContentDocument> cd1 =  [select id,OwnerId,title from ContentDocument];
          system.debug(cd1.size());
       	for(ContentDocument c : cd1)
        {
            system.debug(c);
        } 
       
    } */
    
}