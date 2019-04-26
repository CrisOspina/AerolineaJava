<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div>
            <%
                //clave principal para eliminar registro
                String ced=request.getParameter("ced");
              
                //conexion, preparacion y ejecucion
                Connection cnx=null;
                Statement sta=null;
                ResultSet rs=null;
                
                try
                {
                    Class.forName("com.mysql.jdbc.Driver"); //driver sql
                    cnx=DriverManager.getConnection("jdbc:mysql://localhost/aerolineaBD?user=root&password=");
                    sta=cnx.createStatement(); //preparacion
                    //eliminar registro
                    sta.executeUpdate("delete from usuarios where cedUsu='"+ced+"'");
                    //regresar a la pagina
                    request.getRequestDispatcher("listUsuarios.jsp").forward(request, response);
                }
                    catch(Exception e){out.println(e+"");}
            %>
        </div>
    </body>
</html>
