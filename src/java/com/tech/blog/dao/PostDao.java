/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;


import com.sun.tools.javac.code.Scope;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


public class PostDao {
    
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    
    public ArrayList<Category> getAllCategory()
    {
        ArrayList<Category> list=new ArrayList<>();
        
        
        
        try
        {
            
           String query="select * from categories";
           
          Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(query);
            while(set.next())
            {
                
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                Category c=new Category(cid,name,description);
                list.add(c);
                
            }
            
            
            
        }
        catch(Exception e)
                {
                    
                  e.printStackTrace();
                    
                    
                    
                }
        
        
        
      return list;
    }
    
    
    public  boolean  savePost(Post p)
    {
        boolean f=false;
        
        try
        {
            
          String query="insert into posts(ptitle,pcontent,pcode,ppic,catid,puserid) values(?,?,?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, p.getPtitle());
             pstmt.setString(2, p.getPcontent());
             pstmt.setString(3, p.getPcode());
             pstmt.setString(4,p.getPpic());
             pstmt.setInt(5, p.getCatid());
             pstmt.setInt(6, p.getUserid());
             pstmt.executeUpdate();
             f=true;
            
            
            
        }catch(Exception e)
        {
            
            e.printStackTrace();
            
            
        }
        
        
        
        
        
        
        return f;
    }
    
    
    
    //get all the post
    public List<Post> getAllPosts()
    {
       List<Post> list=new ArrayList();
        
        //fetching all the post
    try
    {
        String q="select * from posts order by pid desc";
        PreparedStatement p=con.prepareStatement(q);
        ResultSet set=p.executeQuery();
        while(set.next())
        {
         
            
            
         int pid=set.getInt("pid");
         String ptitle=set.getString("ptitle");
         String pcontent=set.getString("pcontent");
         String pcode=set.getString("pcode");
         String ppic=set.getString("ppic");
            Timestamp date=set.getTimestamp("pdate");
            int catid=set.getInt("catid");
            int userid=set.getInt("puserid");
            
            Post ppost=new Post(pid,ptitle,pcontent,pcode,ppic,date,catid,userid);
            list.add(ppost);
            
            
            
        }
        
        
    }catch(Exception e)
    {
        
        e.printStackTrace();
        
    }
        
    return list;
    }
    
    
    
    public List<Post> getPostByCatId(int catid)
    {
        
           List<Post> list=new ArrayList();
        
        //fetching all the post by catgory id
        
        try
    {
        
        String q="select * from posts where catid=?";
        PreparedStatement p=con.prepareStatement(q);
        p.setInt(1, catid);
        ResultSet set=p.executeQuery();
        while(set.next())
        {
         
            
            
         int pid=set.getInt("pid");
         String ptitle=set.getString("ptitle");
         String pcontent=set.getString("pcontent");
         String pcode=set.getString("pcode");
         String ppic=set.getString("ppic");
            Timestamp date=set.getTimestamp("pdate");
          
            int userid=set.getInt("puserid");
            
            Post ppost=new Post(pid,ptitle,pcontent,pcode,ppic,date,catid,userid);
            list.add(ppost);
            
            
            
        }
         
        
    }catch(Exception e)
    {
        
        e.printStackTrace();
        
    }
    
    
    return list; 
        
        
        
    }
    
    
    
    public Post getPostbyPostId(int postid) 
    {
        Post post=null;
        try
        {
        String q="select * from posts where pid=?";
        PreparedStatement p=this.con.prepareStatement(q);
        p.setInt(1, postid);
        
        ResultSet set=p.executeQuery();
        if(set.next())
        {
            
           
         int pid=set.getInt("pid");
         String ptitle=set.getString("ptitle");
         String pcontent=set.getString("pcontent");
         String pcode=set.getString("pcode");
         String ppic=set.getString("ppic");
         Timestamp date=set.getTimestamp("pdate");
         int catid=set.getInt("catid");
         int userid=set.getInt("puserid");
            
         post=new Post(pid,ptitle,pcontent,pcode,ppic,date,catid,userid);
            
         //apan ye post naam ka reference rweturn krva rhe hai or ye refrence memory mai us particulr memory area ko point krta hai jisme ye value store hain
            
            
            
        }
        
        
        }catch(Exception e)
        {
         e.printStackTrace();
            
        }
        return post;
    }
    
    
}
