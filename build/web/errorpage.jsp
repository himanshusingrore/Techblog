

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page isErrorPage="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error !!</title>
        
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
       
        
        <div class="container text-center">
            
            <img src="image/error.png" width="150px" height="150px" class="img-fluid" style="margin: 50px">
            
            <h2 style="color: #ff3300">Sorry !! unable to open .Error occurs .please check again!!</h2>
            
            
            <%= exception %>
            
            
            <a href="index.jsp" class="btn bg-primary btn-large text-white m-8">Go back to Home</a>
            
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    </body>
</html>
