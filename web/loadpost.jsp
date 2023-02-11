<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.likeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<script src="js/myjs.js"></script>                                          
<div class="row">

<%
    User uuu=(User)session.getAttribute("currentUser");
   
    
PostDao d=new PostDao(ConnectionProvider.getConnection());

int cid=Integer.parseInt(request.getParameter("cid"));
List<Post> posts=null;
if(cid==0)
{

 posts= d.getAllPosts();
}

else
{
    posts=d.getPostByCatId(cid);
    
}
if(posts.size()==0)
{
    out.println("No Posts in this category");
}

for(Post p:posts)
{
    %>
    
    <!-- html card ko repeatr kraayenge -->
    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blogpic/<%= p.getPpic() %>" alt="Card image cap">
            <div class="card-body">
                <h5> <%= p.getPtitle() %></h5>
                <p><%= p.getPcontent() %></p>
        
            </div>
                <div class="card-footer text-center">
                    
                    <a href="showblogpage.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-primary btn-sm ">Read more>></a>
                     
                                <%
                                likeDao ld=new likeDao(ConnectionProvider.getConnection());
                                

                                %>
                                
                                <a href="#" onclick="dolike(<%= p.getPid() %>,<%= uuu.getId() %>)"  class="btn btn-outline-primary btn-sm "><i class="fa fa-thumbs-o-up"></i><span class="likecounter"><%= ld.countlike(p.getPid()) %></span></a>
                    <a href="#" class="btn btn-outline-primary btn-sm "><i class="fa fa-commenting-o"></i><span>30</span></a>
                </div>
                
        </div>
        
    </div>
    
    
    <%
}



%>
</div>
