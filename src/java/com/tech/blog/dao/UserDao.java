




package com.tech.blog.dao;
import com.tech.blog.entities.User;
import java.sql.*;


public class UserDao {
    private  Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //method to insert user to database
    
    public boolean saveUser(User user)
    {
         boolean f=false;
        try
        {
           
         String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
         PreparedStatement stmt=this.con.prepareStatement(query);
         stmt.setString(1, user.getName());
           stmt.setString(2, user.getEmail());   
             stmt.setString(3, user.getPassword()); 
              stmt.setString(4, user.getGender());
                stmt.setString(5, user.getAbout());
                
                stmt.executeUpdate();
            
            f=true;
            
        }catch(Exception ex)
        {
            
            
        ex.printStackTrace();
            
        }
        
        return f;
        
        
        
    }
    
    
    //getuser by email and password
    
    public User getUserByEmailandPassword(String email ,String password)
    { 
        User user=null;
        
        try
        {
            String query="select * from user where email=? and password=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,email);
            pstmt.setString(2, password);
           ResultSet set= pstmt.executeQuery();
           
           if(set.next())
           {
               
               user=new User();
             user.setName(set.getString("name"));
               user.setId(set.getInt("id"));
                 user.setEmail(set.getString("email"));
                   user.setPassword(set.getString("password"));
                   user.setGender(set.getString("gender"));
                     user.setAbout(set.getString("about"));
                       user.setDateTime(set.getTimestamp("regdate"));
                  user.setProfile(set.getString("profile"));
           }
           
            
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
            
        }
        
        
        
        
        return  user;//ye user k andr sara data aajyega means ye jo function user object return krega iske return
        //kre huye ibject se apan sara data nikaal lenge note user class ka ye vo object hai jo ye method return kr rha hai
        //or jo register page pr tha vo dusra object tha..as we know we can make any no of object of a class..
    }
    
    
    
    public boolean updateUser(User user)
    {
        boolean f=false;
        
      try
      {
          
      String query="update user set name=? , email=? , password=? , gender=? , about=?, profile=? where id=?";  
      PreparedStatement stm=con.prepareStatement(query);
      //ye jo pehle parameter pr number de rhe hai vo upr jo apan ne query likhi hai usko dekh k de rhe hain
      //matlab jo apn ne ? mark diya hai usko represnt kr rha hai matlab pehle ? mark k lie 1, dusre ? k lie 2 etc..
      
      
      stm.setString(1, user.getName());
      stm.setString(2, user.getEmail());
      stm.setString(3, user.getPassword());
      stm.setString(4, user.getGender());
      stm.setString(5, user.getAbout());
      stm.setString(6, user.getProfile());
      stm.setInt(7, user.getId());
          
      stm.executeUpdate();
      f=true;
      
          
      }catch(Exception e)
      {
          
          e.printStackTrace();
          
          
      }
        
      return f;
    }
    
  
    
    public User getuserbyuserid(int uid)
    {
      User user=null;
      try
      {
           String q= "select * from user where id=?";
      PreparedStatement ps=this.con.prepareStatement(q);
      ps.setInt(1, uid);
      ResultSet set=ps.executeQuery();
      if(set.next())
      {
            user=new User();
             user.setName(set.getString("name"));
               user.setId(set.getInt("id"));
                 user.setEmail(set.getString("email"));
                   user.setPassword(set.getString("password"));
                   user.setGender(set.getString("gender"));
                     user.setAbout(set.getString("about"));
                       user.setDateTime(set.getTimestamp("regdate"));
                  user.setProfile(set.getString("profile"));
      } 
          
          
      }catch(Exception e)
      {
          
         e.printStackTrace();
          
      }
      
    
      
      
      return user;
    }
    
}
