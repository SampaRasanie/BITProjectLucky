package pojo;
// Generated Dec 14, 2019 11:55:19 AM by Hibernate Tools 3.6.0



/**
 * Answerdescription generated by hbm2java
 */
public class Answerdescription  implements java.io.Serializable {


     private int idanswerdescription;
     private String ansdtext;
     private String ansdstatus;
     private Integer idanswer;

    public Answerdescription() {
    }

	
    public Answerdescription(int idanswerdescription) {
        this.idanswerdescription = idanswerdescription;
    }
    public Answerdescription(int idanswerdescription, String ansdtext, String ansdstatus, Integer idanswer) {
       this.idanswerdescription = idanswerdescription;
       this.ansdtext = ansdtext;
       this.ansdstatus = ansdstatus;
       this.idanswer = idanswer;
    }
   
    public int getIdanswerdescription() {
        return this.idanswerdescription;
    }
    
    public void setIdanswerdescription(int idanswerdescription) {
        this.idanswerdescription = idanswerdescription;
    }
    public String getAnsdtext() {
        return this.ansdtext;
    }
    
    public void setAnsdtext(String ansdtext) {
        this.ansdtext = ansdtext;
    }
    public String getAnsdstatus() {
        return this.ansdstatus;
    }
    
    public void setAnsdstatus(String ansdstatus) {
        this.ansdstatus = ansdstatus;
    }
    public Integer getIdanswer() {
        return this.idanswer;
    }
    
    public void setIdanswer(Integer idanswer) {
        this.idanswer = idanswer;
    }




}


