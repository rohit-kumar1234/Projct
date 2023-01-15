public class zTestClassEx2 
{
 public static void insertme()
 {
    /* group grp = new group();
     grp.name= 'test group1';
     insert grp;*/
     task tsk = new task();
     tsk.subject = 'test task1';
     tsk.status = 'Not Started';
     tsk.Priority = 'Low';
     insert tsk;
  
 }
}