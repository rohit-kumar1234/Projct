public class list_collection 
{
 
   public static void demo()
   {
       list<integer> lst = new list<integer>();
       
       lst.add(2);
       lst.add(0, 1);
      
       integer[] arr = new integer[]{4,8,99};
       lst.addAll(arr);
       

   }
   public static void acc_records()
   {
       list<Account> acc = new list<Account>();
       
   }
    public static void sets()
    {
        set<integer> st = new set<integer>();
        st.add(2);
        st.add(99);
        st.add(25);
        st.add(56);
        st.add(13);
        system.debug(st);
    }
     public static void sets_obj()
    {
        set<object> st = new set<object>();
        st.add(2);
        st.add('99');
        st.add('zz');
        st.add('qwerty');
        st.add(45);
        system.debug(st);
    }
    public static void map_examples()
    {
        map<integer,string> fruit_map = new  map<integer,string>();
        fruit_map.put(1,'a');
        fruit_map.put(2,'b');
        fruit_map.put(3,'c');
        fruit_map.put(4,'4');
        fruit_map.put(55,'e');
        fruit_map.put(6,'a');
        system.debug(fruit_map.size());
        system.debug(fruit_map);
        
    }
}