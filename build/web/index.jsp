<%-- 
    Document   : index
    Created on : Jul 21, 2021, 6:04:56 PM
    Author     : himanshu
--%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
              crossorigin="anonymous">
      <link  rel="stylesheet"  href="css/allcss.css" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      
      <style>
          .bgbanner
          {
              
             clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 70% 99%, 36% 94%, 0 100%, 0 0);
          }
          
      </style>
      
    </head>
    <body>
        
        <!<!-- navbar -->
        <%@include file="navbar.jsp" %>
        
        <!-- banner -->
        
        <div class="container-fluid p-0 m-0 bgbanner">
            
            <div class="jumbotron text-white  bg-primary">
                <div class="container">
                     
                    <h3 class="display-3">Welcome To TechBlog</h3>
                  <p>welcome to techblog here you can learn many things </p>
                  <p>A programming language is a formal language comprising a set of strings that produce various kinds of machine code output. Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.</p>
                    
                  
                  <button class="btn btn-outline-light"><span class="fa fa-graduation-cap" style="margin: 5px"></span>Start its Free</button>
                  <a href="loginpage.jsp" class="btn btn-outline-light"><span class="fa fa-user-circle fa-spin" style="margin: 5px"></span>Login</a>
                </div>
  
            </div>
            
            
            
        </div>
        
        
        <!<!-- card -->
        <div class="container">
            
            <div class="row mb-2">
                
               <div class="col-md-4">
                
                <div class="card" >

               <div class="card-body">
               <h5 class="card-title">Learn java</h5>
               <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
               <a href="#" class="btn btn-primary">Read more</a>
              </div>
               </div>
                  
            </div>   
                
                
                  <div class="col-md-4">
                
                <div class="card" >

               <div class="card-body">
               <h5 class="card-title">Learn java</h5>
               <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
               <a href="#" class="btn btn-primary">Read more</a>
              </div>
               </div>
                  
            </div>   
                
                  <div class="col-md-4">
                
                <div class="card" >

               <div class="card-body">
               <h5 class="card-title">Learn java</h5>
               <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
               <a href="#" class="btn btn-primary">Read more</a>
              </div>
               </div>
                  
            </div>   
                
                
            </div>
          
            
            
             <div class="row">
                
               <div class="col-md-4">
                
                <div class="card" >

               <div class="card-body">
               <h5 class="card-title">Learn java</h5>
               <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
               <a href="#" class="btn btn-primary">Read more</a>
              </div>
               </div>
                  
            </div>   
                
                
                  <div class="col-md-4">
                
                <div class="card" >

               <div class="card-body">
               <h5 class="card-title">Learn java</h5>
               <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
               <a href="#" class="btn btn-primary">Read more</a>
              </div>
               </div>
                  
            </div>   
                
                  <div class="col-md-4">
                
                <div class="card" >

               <div class="card-body">
               <h5 class="card-title">Learn java</h5>
               <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
               <a href="#" class="btn btn-primary">Read more</a>
              </div>
               </div>
                  
            </div>   
                
                
            </div>
            
            
            
        </div>
        
        
        
        
        
        <% 
        Connection con=ConnectionProvider.getConnection();
        
        %>
        
      
        
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
        crossorigin="anonymous"></script>
        
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" 
integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" 
crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" 
integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" 
crossorigin="anonymous"></script>



    </body>
</html>
