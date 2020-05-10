/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import moduls.Getting;
import moduls.Setting;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import pojo.Question;
import pojo.QuestionSet;

/**
 *
 * @author User
 */
@MultipartConfig
public class Addpaper extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {
            // Create a factory for disk-based file items     	 
            FileItemFactory factory = new DiskFileItemFactory();
            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
            String title = "";
            String sub = "";
            QuestionSet addPaperset = null;
            try {
                // Parse the request       	 
                List /* FileItem */ items = upload.parseRequest(request);
                Iterator iterator = items.iterator();

                String sin_que = null;
                String sin_options = null;
                String sin_A = null;
                String sin_B = null;
                String sin_C = null;
                String sin_D = null;
                String sin_E = null;

                String paths = "";

                HashMap<String, Object> map = new HashMap<>();

                int questionmaxid = new Getting().getQuestionmaxid();
                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();
                    if (!item.isFormField()) {

                        String name = questionmaxid + "" + item.getFieldName() + ".jpg";
                        String root = getServletContext().getRealPath("/");
                        File path = new File(root + "/uploads");
                        if (!path.exists()) {
                            path.mkdirs();
                        }
                        paths = path + "/";
                        File uploadedFile = new File(path + "/" + name);

                        item.write(uploadedFile);
                    } else {

                        map.put(item.getFieldName(), item.getString());
                        System.out.println(item.getFieldName() + "   " + item.getString());
                    }
                }

                if (addPaperset == null) {

                    title = map.get("titele-sin").toString();
                    sub = map.get("subject-sin").toString();

                    if (title != "" && sub != "") {
                        Cookie[] cookies = request.getCookies();
                        String id = "";
                        for (Cookie cooky : cookies) {
                            if (cooky.getName().equals("id")) {
                                id = cooky.getValue();
                            }
                        }
                        addPaperset = new Setting().addPaperset(questionmaxid, title+"_sin", sub, id);

                    }
                }
                for (int i = 1; i <= 50; i++) {
                    sin_que = map.get("sin_que_" + i).toString();
                    sin_options = map.get("sin_" + i + "options").toString();
                    sin_A = map.get("sin_" + i + "_A").toString();
                    sin_B = map.get("sin_" + i + "_B").toString();
                    sin_C = map.get("sin_" + i + "_C").toString();
                    sin_D = map.get("sin_" + i + "_D").toString();
                    sin_E = map.get("sin_" + i + "_E").toString();

                    if (sin_que != null && sin_options != null && sin_A != null && sin_B != null && sin_C != null && sin_D != null && sin_E != null) {
                        Question AddQueaction = new Setting().AddQueaction(sin_que, addPaperset, paths + "/" + questionmaxid + "sin_file_" + i);

                        System.out.println(sin_options + "             sin_options ");

                       // new Setting().AddAnswers(AddQueaction, sin_A + "_" + sin_B + "_" + sin_C + "_" + sin_D + "_" + sin_E, sin_options);
                        sin_que = null;
                        sin_options = null;
                        sin_A = null;
                        sin_B = null;
                        sin_C = null;
                        sin_D = null;
                        sin_E = null;

                    }
                }

            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

}
