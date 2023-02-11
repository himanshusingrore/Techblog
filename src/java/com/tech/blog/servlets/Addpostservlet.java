/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.ConnectionPendingException;
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
public class Addpostservlet extends HttpServlet {

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
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Addpostservlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
           
            int cid=Integer.parseInt(request.getParameter("cid"));
           String ptitle=request.getParameter("ptitle");
           String pcontent=request.getParameter("pcontent");
           String pcode=request.getParameter("pcode");
           
           //getting current user id -apan isko session ki help se nikaalnge kyu ki apan ne
           //isko session mai store krva chuke hain bht pehle
           
           HttpSession session=request.getSession();
                       User user=(User) session.getAttribute("currentUser");
                    
           
           
           
           //ab pic nikalna hai form se then we need datatype Part
           
           Part part=request.getPart("pic");
//           out.print(part.getSubmittedFileName());
         
           
           Post p=new Post(ptitle,pcontent,pcode,part.getSubmittedFileName(),null,cid,user.getId());
           
          
            PostDao postDao=new PostDao(ConnectionProvider.getConnection());
            if(postDao.savePost(p))
            {
                
               
                //apan ne post form se data ko databse pr store krva diya note abhi apan ne postpic ka name store krvaya hain
                //databse pr ab apan filestream ki help se us pic ko project k ander blofpic folder hain waha bhi store krvana hain
                              String path=request.getRealPath("/")+"blogpic"+File.separator +part.getSubmittedFileName();
                Helper.saveFile(part.getInputStream(), path);
                
                 out.println("done");
            }else
            {
                
            out.println("error");    
                
            }
        
//            
//            out.println("</body>");
//            out.println("</html>");
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
