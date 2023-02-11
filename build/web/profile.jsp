<%-- 
    Document   : profile
    Created on : Jul 25, 2021, 12:51:52 PM
    Author     : himanshu
--%>

<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page  errorPage="errorpage.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My profile</title>
        
        <script src="js/myjs.js"></script>
        
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
        
             
        <%   
        
        User user=(User)session.getAttribute("currentUser");
        if(user==null)
        {
           response.sendRedirect("loginpage.jsp");
            
        }
     

        %>
        
        
        
        
        
        
        
    </head>
    <body style="background-image: linear-gradient(to right, #9575cd , white);">
     
        <!-- navbar -->
        
        
             <nav class="navbar navbar-expand-lg navbar-dark mybg">
         <a class="navbar-brand" href="index.jsp"><span class="	fa fa-book"></span>TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fa fa-diamond"></span>Learn it <span class="sr-only">(current)</span></a>
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
        
        
           <%   

                            Message m =(Message)session.getAttribute("msg");
                            if(m!=null)
                            {
                            %>
                            <div class="alert <%= m.getCssClass()%> alert-primary" role="alert">
<%= m.getContent()%>
</div>
                            
                            
                           <%
                               session.removeAttribute("msg");
                               
                               }%>   
        
  <!-- main body -->
                               
                               
  <div class="container">
      <div class="row">
          <!--first column--> 
          <div class="col-md-4 mt-4" style="border: 1px solid black;">
              
              
              
              <!--categories-->
              
              
<div class="list-group">
    <a href="#" onclick="getallpost(0,this)" class="list-group-item list-group-item-action active c-link">
    All Posts
  </a>
    <!-- apan ko database se categories utha k yha pr show krni hain to apan pura logic ni likhenge becoz
    alreday apan ne postdao class k andar getallcategories naam ka mehtod bnaa liya tha jo apan ne model pr use kiya hain
    so we use that same method yha pr bhi means us method ko reuse krenge  islie to dao banaya jata hain ki ek bar mehtod bna 
    lo fir jaha jaha usko use krne ki need pde bs usko use krlo
    -->
  <% 
PostDao d=new PostDao(ConnectionProvider.getConnection());
ArrayList<Category> list1= d.getAllCategory();
for(Category  cc:list1)
{
    %>
    <a href="#" onclick="getallpost(<%= cc.getCid() %>,this)" class="list-group-item list-group-item-action c-link"><%= cc.getName() %></a> 
    
    
<%    
}

 %> 
  
  
</div>
              
          </div>
          <!-- 2nd column --> 
          
          <div class="col-md-8 mt-4"  style="border: 1px solid black;">
              <!--posts-->
              <div class="container text-center" id="loader">
                  <i class="fa fa-refresh fa-3x fa-spin"></i>
                  <h3>loading.....</h3>
              </div>
              <div class="container-fluid" id="postcontainer">
                  
              </div>
              
          </div>
      </div>
      
      
  </div>                              
                               
                               
                               
                               
                               
                               
                             
  <!-- end main body -->
        
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
        
        
        <!-- loading post ->  <!-- comment -->
        <script>
            
            function getallpost(catid,temp)
            {
                $("#loader").show();
                $("#postcontainer").hide();
                
                
                $(".c-link").removeClass('active');
                
                
              $.ajax({
               
              url: "loadpost.jsp",
              data:{cid:catid},
              success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                         $("#postcontainer").show();
                        $("#postcontainer").html(data);
                        $(temp).addClass('active');
                        
                    }
                              
               
               
           })   
                
                
            }
            
          $(document).ready(function (e){
        
        let allpostbtn=$('.c-link')[0]
             getallpost(0,allpostbtn);
             
          });  
            
            
        </script>
        
        
        
        
        
        
        
    </body>
</html>
