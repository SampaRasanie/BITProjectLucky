package pojo;
// Generated Dec 14, 2019 11:55:19 AM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * EnumUserType generated by hbm2java
 */
public class EnumUserType  implements java.io.Serializable {


     private Integer idusertype;
     private String usertype;
     private Set users = new HashSet(0);

    public EnumUserType() {
    }

    public EnumUserType(String usertype, Set users) {
       this.usertype = usertype;
       this.users = users;
    }
   
    public Integer getIdusertype() {
        return this.idusertype;
    }
    
    public void setIdusertype(Integer idusertype) {
        this.idusertype = idusertype;
    }
    public String getUsertype() {
        return this.usertype;
    }
    
    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }
    public Set getUsers() {
        return this.users;
    }
    
    public void setUsers(Set users) {
        this.users = users;
    }




}


