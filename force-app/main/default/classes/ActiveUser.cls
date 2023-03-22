public class ActiveUser {
    public static void userActive() {
	    List<User> userList = new List<User>();
        Map<id,list<User>> userMap = new Map<id,list<User>>();
        userList=[SELECT id, name, email FROM User WHERE IsActive = true];
        System.debug('List of Active Users'+userList);
        for(User obj :userList)
        {
            if(userMap.get(obj.id) == null)
            {
                userMap.put(obj.id,new List<User>());
            }
            userMap.get(obj.id).add(obj);
        }
        System.debug('Map Of User'+userMap);
    }
}