package pojo;
// Generated Dec 14, 2019 11:55:19 AM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * Question generated by hbm2java
 */
public class Question  implements java.io.Serializable {


     private Integer idquestion;
     private EnumQuestionStatus enumQuestionStatus;
     private QuestionSet questionSet;
     private EnumSections enumSections;
     private String questiontext;
     private String imgpath;
     private Set answerses = new HashSet(0);

    public Question() {
    }

	
    public Question(EnumQuestionStatus enumQuestionStatus, QuestionSet questionSet, EnumSections enumSections) {
        this.enumQuestionStatus = enumQuestionStatus;
        this.questionSet = questionSet;
        this.enumSections = enumSections;
    }
    public Question(EnumQuestionStatus enumQuestionStatus, QuestionSet questionSet, EnumSections enumSections, String questiontext, String imgpath, Set answerses) {
       this.enumQuestionStatus = enumQuestionStatus;
       this.questionSet = questionSet;
       this.enumSections = enumSections;
       this.questiontext = questiontext;
       this.imgpath = imgpath;
       this.answerses = answerses;
    }
   
    public Integer getIdquestion() {
        return this.idquestion;
    }
    
    public void setIdquestion(Integer idquestion) {
        this.idquestion = idquestion;
    }
    public EnumQuestionStatus getEnumQuestionStatus() {
        return this.enumQuestionStatus;
    }
    
    public void setEnumQuestionStatus(EnumQuestionStatus enumQuestionStatus) {
        this.enumQuestionStatus = enumQuestionStatus;
    }
    public QuestionSet getQuestionSet() {
        return this.questionSet;
    }
    
    public void setQuestionSet(QuestionSet questionSet) {
        this.questionSet = questionSet;
    }
    public EnumSections getEnumSections() {
        return this.enumSections;
    }
    
    public void setEnumSections(EnumSections enumSections) {
        this.enumSections = enumSections;
    }
    public String getQuestiontext() {
        return this.questiontext;
    }
    
    public void setQuestiontext(String questiontext) {
        this.questiontext = questiontext;
    }
    public String getImgpath() {
        return this.imgpath;
    }
    
    public void setImgpath(String imgpath) {
        this.imgpath = imgpath;
    }
    public Set getAnswerses() {
        return this.answerses;
    }
    
    public void setAnswerses(Set answerses) {
        this.answerses = answerses;
    }




}


