<%-- 
    Document   : showblogpage
    Created on : Aug 15, 2021, 4:59:02 PM
    Author     : himanshu
--%>

<%@page import="com.tech.blog.dao.likeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  errorPage="errorpage.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/hi_IN/sdk.js#xfbml=1&version=v11.0" nonce="UmDsBNVq"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                 <%   
        
        User user=(User)session.getAttribute("currentUser");
        if(user==null)
        {
           response.sendRedirect("loginpage.jsp");
            
        }
      

        %>
        
        <% 
int postid=Integer.parseInt(request.getParameter("post_id"));
PostDao d=new PostDao(ConnectionProvider.getConnection());
Post p=d.getPostbyPostId(postid);

        %>
        <title><%= p.getPtitle()  %></title>
         
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
              crossorigin="anonymous">
      <link  rel="stylesheet"  href="css/allcss.css" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <script src="js/myjs.js"></script>
      <style>
          .bgbanner
          {
              
             clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 70% 99%, 36% 94%, 0 100%, 0 0);
          }
          .posttitle
          {
              font-weight: 100;
              font-size: 30px;
          }
          .postcontent
          {
              font-weight: 100;
              font-size: 21px;
          }
          .postdate
          {
              font-style: italic;
              font-weight: bold;
          }
          .postusername
          {
              font-size: 18px;
             
              
          }
          
      </style>
        
    </head>
    <body style="background-image: linear-gradient(to right, #9575cd , white);">
   
      <!-- navbar -->
        
        
      <nav class="navbar navbar-expand-lg navbar-dark mybg" >
         <a class="navbar-brand" href="index.jsp"><span class="	fa fa-book"></span>TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="profile.jsp"><span class="fa fa-diamond"></span>Learn it <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span class="	fa fa-share"></span> Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">ddatastriciree</a>
        </div>
      </li>
      
     <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-phone"></span>Contact</a>
      </li>
        <li class="nav-item">
        <a class="nav-link text-white" href="#"  data-toggle="modal" data-target="#addpostmodel"><span class="fa fa-phone"></span>do Post</a>
      </li>
        
      
    </ul>
 
      <ul class="navbar-nav mr-right">
          
          <li class="nav-item ml-2">
           <a href="#!" class="btn text-white "  data-toggle="modal" data-target="#profileModal"><span class="fa fa-user-circle" style="margin: 5px"></span><%= user.getName() %></a>
      </li>
          
       <li class="nav-item ml-2">
           <a href="LogoutServlet" class="btn btn-outline-light"><span class="fa fa-user-plus" style="margin: 5px"></span>LogOut</a>
      </li>
           
          
      </ul>
      
      
  </div>
</nav>
        
 
        <!-- ende of navbar --> 
        
        <!-- main content of body -->
        
        
        <div class="container">
            
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    
                    <div class="card">
                        <div class="card-header">
                            <h4 class="posttitle"><%= p.getPtitle() %></h4>
                        </div>
                        
                        <div class="card-body">
                            
                            <img class="card-img-top" src="blogpic/<%= p.getPpic() %>" alt="Card image cap">
                            <div class="row my-3">
                                <div class="col-md-8">
                                    <% 
                                    UserDao ud=new UserDao(ConnectionProvider.getConnection());
                                    
                                    %>
                                    <p class="postusername">posted by <a href="#"> <%= ud.getuserbyuserid(p.getUserid()).getName() %></a></p>
                                </div>
                                <div class="col-md-4">
                                    <p class="postdate"><%= DateFormat.getDateTimeInstance().format(p.getPdate()) %></p>
                                </div>
                            </div>
                            <p class="postcontent">
                                <%= p.getPcontent()  %>
                                
                            </p>
                            <br><br>
                            <div class="postcode">
                                <pre><%= p.getPcode() %></pre>
                            </div>
                            
                        </div>
                            <div class="card-footer text-right">
                                
                                <%
                                likeDao ld=new likeDao(ConnectionProvider.getConnection());
                                

                                %>
                                
                   
                                <a href="#" onclick="dolike(<%= p.getPid() %>,<%= user.getId() %>)" class="btn btn-outline-primary btn-sm "><i class="fa fa-thumbs-o-up"></i><span class="likecounter"><%= ld.countlike(p.getPid()) %></span></a>
                    <a href="#" class="btn btn-outline-primary btn-sm "><i class="fa fa-commenting-o"></i><span>30</span></a>
                </div>
                    <div class="card-footer">
                        <div class="fb-comments" data-href="http://localhost:8081/Techblog/showblogpage.jsp?post_id=<%=  p.getPid() %>" data-width="" data-numposts="5"></div>
                    </div>
                        
                    </div>
                    
                    
                </div>
                
            </div>
            
            
            
            
            
        </div>
        
        
        
        
        
        
        <!-- end of main content -->
        
            <!-- profile model -->  
        
        <!-- Button trigger modal -->
        

<!-- Modal -->
<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header bg-primary text-white " >
        <h5 class="modal-title" id="exampleModalLabel">Techblog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              <img src="profile/<%= user.getProfile() %>" width="100px" height="100px" style="border-radius: 50%"/>
              
               <h5 class="modal-title" id="exampleModalLabel"><%= user.getName() %></h5>
               
               
               <!<!-- details -->
               <div id="profiledetail">
               
               <table class="table">
  
  <tbody>
    <tr>
      <th scope="row">ID:</th>
      <td><%= user.getId() %></td>
   
    </tr>
    <tr>
      <th scope="row">Email:</th>
      <td><%= user.getEmail() %></td>
   
    </tr>
    <tr>
      <th scope="row">About me:</th>
      <td><%= user.getAbout() %></td>
  
    </tr>
    
     <tr>
      <th scope="row">Gender:</th>
      <td><%= user.getGender() %></td>
  
    </tr>
    
     <tr>
      <th scope="row">Register Date:</th>
      <td><%= user.getDateTime().toString() %></td>
  
    </tr>
    
  </tbody>
</table>
               
               
               </div> 
      
      
      <!-- profile edit menu -->
      <div id="profileedit" style="display: none">
          
          <h3 class="mt-2">Edit your profile</h3>
          <form action="EditServlet" method="POST" enctype="multipart/form-data">
              <table class="table">
                  <tr>
                      <td>ID:</td>
                      <td><%= user.getId() %></td>
                      
                  </tr>
                  
                    <tr>
                      <td>Email:</td>
                      <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"  /></td>
                      
                  </tr>
                  
                  
                   <tr>
                      <td>Name:</td>
                      <td><input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"  /></td>
                      
                  </tr>
                  
                   <tr>
                      <td>Password:</td>
                      <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"  /></td>
                      
                  </tr>
                  
                  <tr>
                      <td>Gender:</td>
                      <td><%= user.getGender() %></td>
                      
                  </tr>
                  
                   <tr>
                      <td>About me:</td>
                      <td>
                          <textarea rows="4" class="form-control " name="user_about"><%= user.getAbout() %></textarea>
                          
                          
                          
                      </td>
                      
                  </tr>
                  
                  
                  
                    <tr>
                      <td>Change profile:</td>
                      <td>
                          <input type="file" name="user_image" class="form-control"/>
                      </td>
                      
                  </tr>
                  
                  
                  
                  
                  
              </table>
                          
                          <div class="container">
                              <button type="submit" class="btn btn-outline-success">Save</button> 
                              
                          </div>
              
          </form>
          
          
          
      </div>
      
      
      
      
      
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="editprofilebtn" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
        
        
        
        
        
        
        
        <!-- end of profilr model -->
       
        
        <!-- post model -->
        
        
        <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="addpostmodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center" id="exampleModalLabel">Enter Posts details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
          
          
          
          
          
          
          <form id="addpostform" action="Addpostservlet" method="post" >
              <div class="form-group"> 
                  <select class="form-control" name="cid">
 
                      <option selected disabled>---SELECT CATEGORY---</option>
                      
                      <%
         PostDao postd=new PostDao(ConnectionProvider.getConnection());
         ArrayList<Category> list= postd.getAllCategory();
         
       for(Category c:list)
       {
          %> 
           
          <option value="<%= c.getCid() %>" > <%=  c.getName()%> </option>
               
          
          
      <% }
 
                          %>
                      
                      
                      
            

              </select>
              </div>
              
              <div class="form-group">
                  
                  <input name="ptitle" class="form-control" type="text" placeholder="enter post title"/>
           
                
              </div>
               <div class="form-group">
                  
                   <textarea  name="pcontent" class="form-control" placeholder="enter your content"></textarea>
           
                
              </div>
               <div class="form-group">
                  
                   <textarea name="pcode" style="text-align: start" class="form-control " placeholder="enter your program code if any"></textarea>
           
                
              </div>
           
              
              <div class="form-group">
                  
                  <input name="pic" class="form-control"  type="file" />
                
              </div> 
              
              
               
              <div class="form-group">
                  
                  <input  class="form-control btn-primary"  type="submit" value="post"/>
                
              </div> 
              
              
          </form>  
         
          
          
          
          
          
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
        
        




<!-- end post model -->
           
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
        crossorigin="anonymous"></script>
        
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" 
integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" 
crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" 
integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" 
crossorigin="anonymous"></script>

<script  src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"  ></script>

<script>
   $(document).ready(function ()
   {
       
       let editStatus= false;//ye toggle button bnnae ka logic hain
       
       
      $('#editprofilebtn').click(function ()
      {
          //togel button ka logic hai-jese hi document ready hoga editstatus mai false chlaa jayega thek and
          //jese hi aap edit button pr click krenge aapko if-else chlega at first time editstatus ki value false milegi
          //islie if block chlega thek and detail wala div hide ho jyega and edit wala div show hoga and editstatus ki value
          //mai true daal denge thek. ab next time fir se agar butn pr click kroge to is baar if block nahi chlega becoz of conditon false
          //is baar else block chlega and detail wali div show hogi and edit wala div hide nd edittatus ki value false set hojyegi
          //idhr ye process chlte rhegi and apni butn work like toggel button
          
          
          
          
        if(editStatus==false)
        {
            $('#profiledetail').hide();
            $('#profileedit').show();
            
            editStatus=true;
            
            $(this).text("Back");
            
        }else
        {
            
         $('#profiledetail').show();
            $('#profileedit').hide();
            
            editStatus=false;    
             $(this).text("Edit");
            
        }
          
          
      });
       
       
       
   }); 
    
    
    </script>
        
    
 <!--adding addpost js-->
 <script> 
    
    $(document).ready(function (){
      
        $("#addpostform").on("submit",function (event){
           //jese hi form submit hoga ye function chl jayega
           event.preventDefault();//apan ye line likh k keh rhe hain ki bydefault jo submittion ho raha hain
           //submit button dabane se vo ruk jaaye..
             console.log("you clicked on submit");
           let form= new FormData(this);
           //now requesting the server
           
         
           $.ajax({
               url:"Addpostservlet",
               type: 'POST',
               data:form,
               success: function (data, textStatus, jqXHR) {
                        //jab request succesfull ho jayegi matlab chlejyegi
                     console.log(data);
                     
                     if(data.trim()=='done')
                     {
                         
                       swal("post added succesfully!", "     ", "success");
              
                        
                     }
                     else
                     {
                         swal("some thing went wrong!", "   ", "error");
                       
                     }
                       
                   
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //if any error occures this function executes
                         swal("some thing went wrong!", "   ", "error");
                    },
                    processData: false,
                    contentType: false
               
           })
            
            
        });
      
    });
    
    
        </script>
        

    </body>
</html>
