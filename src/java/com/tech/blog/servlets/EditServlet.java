/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author himanshu
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
       
            String userEmail=request.getParameter("user_email");
            String userName=request.getParameter("user_name");
            String userPassword=request.getParameter("user_password");
            String userabout=request.getParameter("user_about");
            //ab image lena hai form se toh in servlet apan file ko normal nahi uthaayneg balki apan file ko ek part naam k variable mai
            //store krva lenge isse file ka pura data part k andr store ho jyega and fir us part se apan us particulr file k data mai
            //se jo uthana hoga utha lenge
            
            Part part=request.getPart("user_image");
            String imagename=part.getSubmittedFileName();
            
            
            //get user from session so that we can update that data
            
            HttpSession s=request.getSession();
         User edituser = (User) s.getAttribute("currentUser");
            
            edituser.setEmail(userEmail);
            edituser.setName(userName);
            edituser.setPassword(userPassword);
            edituser.setAbout(userabout);
            String oldfile=edituser.getProfile();
            edituser.setProfile(imagename);
            
            
            //abi upr apan ne user k object mai setter ki help se new data dal diya hain now ab apan waha se getter ki help se 
            //data uthaayneg or database mai update krva denge
            
            UserDao userDao=new UserDao(ConnectionProvider.getConnection());
          boolean ans=  userDao.updateUser(edituser);
            if(ans)
            {
                
              out.println("Updated");
              
              String path=request.getRealPath("/")+"profile"+File.separator+edituser.getProfile();
              
              //delete
                    String oldpath=request.getRealPath("/")+"profile"+File.separator+oldfile;
                    
                    if(!oldpath.equals("default.png"))
                    {
                        
              Helper.deletefile(oldpath);
                    }
              
              
              
              
              
             if(Helper.saveFile(part.getInputStream(), path))
             {
                    
                    
                     Message msg=new Message("profile updated","success","alert-success");
                     s.setAttribute("msg", msg);
                 
             }else
             {
               Message msg=new Message("something went wrong","error","alert-danger");
               s.setAttribute("msg", msg);
                 
             }
             
         
                
            }
            else
            {
            Message msg=new Message("something went wrong","error","alert-danger");
               s.setAttribute("msg", msg);
                
                
            }
            response.sendRedirect("profile.jsp");
            
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
