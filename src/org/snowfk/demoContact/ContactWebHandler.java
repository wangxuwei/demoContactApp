package org.snowfk.demoContact;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.snowfk.web.db.hibernate.HibernateDaoHelper;
import org.snowfk.web.method.WebAction;
import org.snowfk.web.method.WebModel;
import org.snowfk.web.method.WebParam;

import com.google.inject.Inject;
import com.google.inject.Singleton;

@Singleton
public class ContactWebHandler {
	HibernateDaoHelper daoHelper;
    @Inject
    public ContactWebHandler(HibernateDaoHelper daoHelper){
       this.daoHelper = daoHelper;
    }

    /**
     * list all contacts
     * @param m
     * @param groupId
     */
    @WebModel(startsWith = "/home")
    public void contact(Map m,@WebParam("groupId") Long groupId,@WebParam("contactId") Long contactId) {        
    	Group group = daoHelper.get(Group.class, groupId);
        if(group!=null){
        	m.put("group",group);
        }
        List<Group> groups = (List<Group>) daoHelper.find(0,100,"from Group");
        m.put("groups",groups);
        
        Contact contact = daoHelper.get(Contact.class, contactId);
        if(contact!=null){
        	m.put("contact",contact);
        }
        
        List<Contact> contacts = null;
        if(group!=null){
        	contacts = (List<Contact>) daoHelper.find(0,100,"select c from Contact c join c.groups g  where g.id=?",group.getId());
        }else{
        	contacts = (List<Contact>) daoHelper.find(0,100,"from Contact c ");
        }
        m.put("contacts",contacts);
    }
    
    /**
     * Create Or Update Contact
     * @param contactMap
     */
    @WebAction
    public void createOrUpdateContact(@WebParam("contact.") Map contactMap){
    	Long id = String.valueOf(contactMap.get("id")).equals("")?null:new Long(String.valueOf(contactMap.get("id")));
    	Contact contact = daoHelper.get(Contact.class,id);
    	if(contact==null){
    		contact = new Contact();
    		contact.setFirstName((String) contactMap.get("firstName"));
    		contact.setLastName((String) contactMap.get("lastName"));
    		daoHelper.save(contact);
    	}else{
    		contact.setFirstName((String) contactMap.get("firstName"));
    		contact.setLastName((String) contactMap.get("lastName"));
    		daoHelper.update(contact);
    		Object obj = contactMap.get("groupIds");
    		if(obj!=null){
    			if(obj instanceof String){
    				Long groupId = new Long((String)obj);
    				Group group = daoHelper.get(Group.class, groupId);
    				contact.getGroups().clear();
    				contact.getGroups().add(group);
    			}
    			if(obj instanceof String[]){
    				String[] groupIds = (String[])obj;
    				contact.getGroups().clear();
    				for(int i=0;i<groupIds.length;i++){
    					Long groupId = new Long(groupIds[i]);
    					Group group = daoHelper.get(Group.class, groupId);
        				contact.getGroups().add(group);
    				}
    			}
    			daoHelper.update(contact);
    		}
    	}
    }
    
    /**
     * Delete Contact
     * @param contactMap
     */
    @WebAction
    public void deleteContact(@WebParam("contact.") Map contactMap){
    	Long id = String.valueOf(contactMap.get("id")).equals("")?null:new Long(String.valueOf(contactMap.get("id")));
    	 Contact contact = daoHelper.get(Contact.class, id);
         if(contact!=null){
        	 daoHelper.delete(contact);
         }
    }

}
