package pojo;
// Generated Dec 14, 2019 11:55:19 AM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * EnumUserStatus generated by hbm2java
 */
public class EnumUserStatus  implements java.io.Serializable {


     private Integer idenumuserstatus;
     private String status;
     private Set users = new HashSet(0);

    public EnumUserStatus() {
    }

    public EnumUserStatus(String status, Set users) {
       this.status = status;
       this.users = users;
    }
   
    public Integer getIdenumuserstatus() {
        return this.idenumuserstatus;
    }
    
    public void setIdenumuserstatus(Integer idenumuserstatus) {
        this.idenumuserstatus = idenumuserstatus;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    public Set getUsers() {
        return this.users;
    }
    
    public void setUsers(Set users) {
        this.users = users;
    }




}


