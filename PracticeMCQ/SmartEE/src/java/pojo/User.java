package pojo;
// Generated Dec 14, 2019 11:55:19 AM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * User generated by hbm2java
 */
public class User  implements java.io.Serializable {


     private Integer iduser;
     private EnumUserType enumUserType;
     private EnumSecurityQuestions enumSecurityQuestions;
     private Account account;
     private EnumUserStatus enumUserStatus;
     private String username;
     private String password;
     private String firstname;
     private String lastname;
     private String email;
     private String secquestionaswer;
     private Set answersHistories = new HashSet(0);
     private Set questionSets = new HashSet(0);
     private Set practiceQuestionSets = new HashSet(0);

    public User() {
    }

	
    public User(EnumUserType enumUserType, EnumSecurityQuestions enumSecurityQuestions, Account account, EnumUserStatus enumUserStatus) {
        this.enumUserType = enumUserType;
        this.enumSecurityQuestions = enumSecurityQuestions;
        this.account = account;
        this.enumUserStatus = enumUserStatus;
    }
    public User(EnumUserType enumUserType, EnumSecurityQuestions enumSecurityQuestions, Account account, EnumUserStatus enumUserStatus, String username, String password, String firstname, String lastname, String email, String secquestionaswer, Set answersHistories, Set questionSets, Set practiceQuestionSets) {
       this.enumUserType = enumUserType;
       this.enumSecurityQuestions = enumSecurityQuestions;
       this.account = account;
       this.enumUserStatus = enumUserStatus;
       this.username = username;
       this.password = password;
       this.firstname = firstname;
       this.lastname = lastname;
       this.email = email;
       this.secquestionaswer = secquestionaswer;
       this.answersHistories = answersHistories;
       this.questionSets = questionSets;
       this.practiceQuestionSets = practiceQuestionSets;
    }
   
    public Integer getIduser() {
        return this.iduser;
    }
    
    public void setIduser(Integer iduser) {
        this.iduser = iduser;
    }
    public EnumUserType getEnumUserType() {
        return this.enumUserType;
    }
    
    public void setEnumUserType(EnumUserType enumUserType) {
        this.enumUserType = enumUserType;
    }
    public EnumSecurityQuestions getEnumSecurityQuestions() {
        return this.enumSecurityQuestions;
    }
    
    public void setEnumSecurityQuestions(EnumSecurityQuestions enumSecurityQuestions) {
        this.enumSecurityQuestions = enumSecurityQuestions;
    }
    public Account getAccount() {
        return this.account;
    }
    
    public void setAccount(Account account) {
        this.account = account;
    }
    public EnumUserStatus getEnumUserStatus() {
        return this.enumUserStatus;
    }
    
    public void setEnumUserStatus(EnumUserStatus enumUserStatus) {
        this.enumUserStatus = enumUserStatus;
    }
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public String getFirstname() {
        return this.firstname;
    }
    
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }
    public String getLastname() {
        return this.lastname;
    }
    
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getSecquestionaswer() {
        return this.secquestionaswer;
    }
    
    public void setSecquestionaswer(String secquestionaswer) {
        this.secquestionaswer = secquestionaswer;
    }
    public Set getAnswersHistories() {
        return this.answersHistories;
    }
    
    public void setAnswersHistories(Set answersHistories) {
        this.answersHistories = answersHistories;
    }
    public Set getQuestionSets() {
        return this.questionSets;
    }
    
    public void setQuestionSets(Set questionSets) {
        this.questionSets = questionSets;
    }
    public Set getPracticeQuestionSets() {
        return this.practiceQuestionSets;
    }
    
    public void setPracticeQuestionSets(Set practiceQuestionSets) {
        this.practiceQuestionSets = practiceQuestionSets;
    }




}


