
package com.tech.blog.dao;

import java.sql.*;


public class likeDao {
    
    Connection con;

    public likeDao(Connection connection) {
        this.con = connection;
    }

    public likeDao() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
   public boolean insertlike(int pid, int uid)
   {
       boolean f=false;
      try
      {
         
       String q="insert into liked(pid,uid) values(?,?) ";
       PreparedStatement p= this.con.prepareStatement(q);
       //now ? pr value set kreneg
       p.setInt(1, pid);
           p.setInt(2, uid);
           p.executeUpdate();
           f=true;
          
      }catch(Exception e)
      {
          e.printStackTrace();
          
      }
       return  f;
   }
    
    public int countlike(int pid)
    {
        int count=0;
        
      
        try
        {
              String c="select count(*) from liked where pid=?";
        PreparedStatement pc=this.con.prepareStatement(c);
        pc.setInt(1, pid);
           ResultSet set= pc.executeQuery();
            if(set.next())
            {
                count=set.getInt("count(*)");
            }
            
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
            
            
        }
        
        
        
        return count;
    }
    
    public boolean  islikedbyuser(int pid,int uid)
    {
        boolean f=false;
        try
        {
            String l="select * from liked where pid=? and uid=?";// is method se apan ye chek kr rhe hai ki user ne alredy post pr like kiya hai ki ni agr kiya hoga toh apan dislkie butn krdege frontend mai
              PreparedStatement pl=this.con.prepareStatement(l);
        pl.setInt(1, pid);
        pl.setInt(2,uid);
           ResultSet set= pl.executeQuery();
            if(set.next())
            {
               f=true;
            }
            
            
        }catch(Exception e)
        {
            
            
        }
        
        return f;
    }
    
    public boolean  deletelike(int pid,int uid)
    {
        boolean f=false;
        
        try
        {
          String del="delete from liked where pid=? and uid=?"; 
           PreparedStatement p=this.con.prepareStatement(del);
        p.setInt(1, pid);
        p.setInt(2,uid);
            p.executeUpdate();
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            
        }
        
        return  f;
    }
}
