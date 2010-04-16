package org.snowfk.demoContact;

import java.util.List;
import java.util.Map;

import org.snowfk.web.db.hibernate.HibernateDaoHelper;
import org.snowfk.web.method.WebAction;
import org.snowfk.web.method.WebModel;
import org.snowfk.web.method.WebParam;

import com.google.inject.Inject;
import com.google.inject.Singleton;

@Singleton
public class GroupWebHandler {
	HibernateDaoHelper daoHelper;
    @Inject
    public GroupWebHandler(HibernateDaoHelper daoHelper){
       this.daoHelper = daoHelper;
    }
    
    /**
     * Create Or Update Group
     * @param groupMap
     */
    @WebAction
    public void createOrUpdateGroup(@WebParam("group.") Map groupMap){
    	Long id = String.valueOf(groupMap.get("id")).equals("")?null:new Long(String.valueOf(groupMap.get("id")));
    	Group group = daoHelper.get(Group.class, id);
    	if(group==null){
    		group = new Group();
    		group.setName((String) groupMap.get("name"));
    		daoHelper.save(group);
    	}else{
    		group.setName((String) groupMap.get("name"));
    		daoHelper.update(group);
    	}
    }
    
    /**
     * Delete Group
     * @param groupMap
     */
    @WebAction
    public void deleteGroup(@WebParam("group.") Map groupMap){
    	Long id = String.valueOf(groupMap.get("id")).equals("")?null:new Long(String.valueOf(groupMap.get("id")));
    	 Group group = daoHelper.get(Group.class, id);
         if(group!=null){
        	 daoHelper.delete(group);
         }
    }
}
