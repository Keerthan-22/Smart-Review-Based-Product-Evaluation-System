<%@page import="code.DB"%>
<%@page import="java.sql.*"%>
<%
    String uname=request.getParameter("uname");
    String uid=request.getParameter("uid");
    String pid=request.getParameter("pid");
    String pname=request.getParameter("pname");
    session.setAttribute("uname", uname);
    session.setAttribute("uid", uid);
    Connection con= DB.getConnection();
    int rank=0;
    PreparedStatement ps=con.prepareStatement("select * from add_product where pid='"+pid+"' and pname='"+pname+"' ");
    ResultSet r=ps.executeQuery();
    if(r.next()){
         rank=r.getInt("rank")+1;
         PreparedStatement p=con.prepareStatement("UPDATE add_product SET `rank`=?, buyerid=?, buyername=? WHERE pid=? AND pname=?");
p.setInt(1, rank);
p.setString(2, uid);
p.setString(3, uname);
p.setString(4, pid);
p.setString(5, pname);

         p.executeUpdate();
         System.out.println(p);
    }
    else{
        System.out.println("try again");
    }
    out.println("<script>"
        +"alert('You will get the Product within 2-3 days.')"
        +"</script>");
    RequestDispatcher rd=request.getRequestDispatcher("Give_Feedback.jsp");
    rd.include(request, response);
%>