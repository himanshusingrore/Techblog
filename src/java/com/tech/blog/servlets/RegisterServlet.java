/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author himanshu
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {

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
          
           
              String check=request.getParameter("check");
            
          
            if (check==null) {
                 out.println("please agree terms and condition");
                
            }else
            {
                String name=request.getParameter("user_name");
              String email=request.getParameter("user_email");
                String password=request.getParameter("user_password");
                  String gender=request.getParameter("gender");
                    String about=request.getParameter("user_about");
                    
                 //yha we are taking values from user and putting inside user object ap constructor ya setter dono ki help se kr skte ho
                 
                User user=new User(name,email,password,gender,about);
            
                
             ConnectionProvider conn=new ConnectionProvider();
             Connection connect=conn.getConnection();
                
                UserDao userDao=new UserDao(connect);
                boolean saveUser = userDao.saveUser(user);
                
                if(saveUser)
                {
                    out.print("data");
                }else
                {
                    out.print("something went wrong");
                }
                
                
                
            }
            
            
            
            
       
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
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
