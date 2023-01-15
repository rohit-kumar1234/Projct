@isTest
private class IsTestClass 
{
    @isTest
	static void Testme()
    {
        zTestClassExamples test = new zTestClassExamples();
        test.test2();
            
        system.assertEquals('test12', test.name);
        system.assertEquals(12, test.age);
        system.assertEquals(false, test.isMale);
        /*----------------------------------------------*/
         test.test1();
            
        system.assertEquals('prasanth', test.name);
        system.assertEquals(26, test.age);
        system.assertEquals(true, test.isMale);
  /*-----------------------------------------------------*/
        test.flag = true;
        test.test3();
        system.assertEquals('one', test.name);
        system.assertEquals(1, test.age);
        system.assertEquals(true, test.isMale);
        
        test.flag = false;
        test.test3();
        system.assertEquals('two', test.name);
        system.assertEquals(2, test.age);
        system.assertEquals(false, test.isMale);
        
    }
    @isTest
    static void Testme1()
    {
        
    }
}