@isTest
public class IsTestClass2 
{
    @testSetup static void testData()
    {
        task tsk = new task();
        tsk.Subject = 'call';
        tsk.Priority = 'Low';
        tsk.status = 'Not Started';
        insert tsk;
        
    }
    
	@isTest
    static void testme()
    {
        zTestClassEx2.insertme();
        task tk = [select id,subject,priority,status  from task];
        
        system.assertEquals('call', tk.subject);
        system.assertEquals('low', tk.Priority);
        system.assertEquals('Not Started', tk.status);
        
    }
}