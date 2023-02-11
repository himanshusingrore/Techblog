<%-- 
    Document   : registerpage
    Created on : Jul 22, 2021, 10:39:45 AM
    Author     : himanshu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
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
        <%@include file="navbar.jsp" %>
        
        <main class="bg-primary p-5 bgbanner" style="padding-bottom: 80px">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    
                    <div class="card">
                        <div class="card-header text-center">
                               <span class="	fa fa-user-plus fa-3x"></span><br>
                            Register here
                            
                        </div>
                        
                        <div class="card-body">
                            <!<!-- FORM -->       
                            
                            <form  action="RegisterServlet" method="post" id="reg-form">
                                
                                <div class="form-group">
    <label for="exampleInputEmail1">Username</label>
    <input type="text" name="user_name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter username">

  </div>
                                
                                
                                
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
                                
                                
                                
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
                                
          
                                 <div class="form-group">
                                     <label for="gender">select gender</label><br>
                                     <input type="radio"  id="exampleInputPassword1" name="gender" value="Male">Male
                                     <input type="radio"  id="exampleInputPassword1" name="gender" value="Female">Female
  </div>
                                
                                  <div class="form-group">
                                      <textarea name="user_about" class="form-control" placeholder="Enter something about yourself">
                                          

                                      </textarea>

  </div>
                                
                                
                                
                                
                                
  <div class="form-check">
      <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">I agree terms and condition</label>
  </div>
                                
                                <br>        
                                
                                <div class="container" id="loader" style="display: none">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    
                                    
                                </div>
                                
                                <button id="loadbtn" type="submit"  class="btn btn-primary">Submit</button>
</form>
                            
                        </div>
                        
                     
                    </div>
                    
                    
                </div>
                
             </div>    
            
            
            
            
            
            
            
            
            
        </main>
        
        
        <!<!-- script -->
           
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
        crossorigin="anonymous"></script>
        
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" 
integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" 
crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" 
integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" 
crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

     <script type="text/javascript">
         
         $(document).ready(function ()
         {
             $('#reg-form').on('submit',function(event)
             {
                
           event.preventDefault();
            
            let form=new FormData(this);
            $('#loadbtn').hide();
            $('#loader').show();
            
            $.ajax({
                
               url:"RegisterServlet",
               type:'POST',
               data:form,
               success: function (data, textStatus, jqXHR) {
                 
                         $('#loadbtn').show();
                         $('#loader').hide(); 
                         
                         if(data=='data')
                         {
                          swal("succesfully register !!thankyou..")
.then((value) => {

window.location="loginpage.jsp"
});   
                             
                         }else
                         {
                             
                            swal(data);  
                             
                         }
                         
         },
                    error: function (jqXHR, textStatus, errorThrown) {
                         $('#loadbtn').show();
                         $('#loader').hide(); 
                          alert("failed to register");
                   },
                    processData: false,
                    contentType: false
                
            });
        
             });
             
             
             
             
         });
         
     
     
     </script>
     
     
     
     
    
   
        
        
        
        
    </body>
</html>
