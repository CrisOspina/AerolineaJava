<%@page import="java.sql.*"%> <!--librerias-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body style="background-color:#E0F8F7">
        <div class="container">
            <hr>
            <h1 align="center">Actualizar datos</h1>
            <hr>
            <%
                String ced=request.getParameter("ced");
       
                Connection cnx=null;
                Statement sta=null; 
                ResultSet rs=null;
            
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx=DriverManager.getConnection("jdbc:mysql://localhost/aerolineaBD?user=root&password=");
                    sta=cnx.createStatement();
                    //actualizacion
                    rs=sta.executeQuery("select * from usuarios where cedUsu='"+ced+"'");
            
            
                    while(rs.next()){ //vaciar resultado
            %>
            <form action="" name="" method="get">
                <div class="form-group">
                    Cédula: <input class="form-control" type="text" name="cedula" id="" value="<%=rs.getString(1)%>"/><br>
                    Nombres: <input class="form-control" type="text" name="nombres" id="" value="<%=rs.getString(2)%>"/><br>
                    Edad: <input class="form-control" type="text" name="edad" id="" value="<%=rs.getInt(3)%>"/><br>
                    E-mail: <input class="form-control" type="text" name="email" id="" value="<%=rs.getString(4)%>"/><br>
                    Celular: <input class="form-control" type="text" name="celular" id="" value="<%=rs.getString(5)%>"/><br>
                    Ciudad: <input class="form-control" type="text" name="ciudad" id="" value="<%=rs.getString(6)%>"/><br>
                    Viaje: <select class="form-control" name="viaje" value="<%=rs.getString(7)%>">
                            <option value="nacional">Nacional</option>
                            <option value="internacional">Internacional</option>
                        </select><br>
                </div>
                            
                <div align="center">
                    <input class="btn btn-primary" type="submit" name="btnActualizar" id="" value="Actualizar"/>
                    <hr>
                </div>
            </form>
            <%
                }
            }catch(Exception e){}

            if(request.getParameter("btnActualizar")!=null)
            {
                //recibiendo datos ingresados por el usuario
                String cedu=request.getParameter("cedula");
                String nom=request.getParameter("nombres");
                int ed=Integer.parseInt(request.getParameter("edad"));
                String ema=request.getParameter("email");
                String cel=request.getParameter("celular");
                String ciu=request.getParameter("ciudad");
                String via=request.getParameter("viaje");
            
                sta.executeUpdate("update usuarios set cedUsu='"+cedu+"', nomUsu='"+nom+"', edadUsu="+ed+", emailUsu='"+ema+"', celuUsu='"+cel+"', ciudUsu='"+ciu+"', viaUsu='"+via+"' where cedUsu='"+cedu+"'");
                //regresar
                request.getRequestDispatcher("listUsuarios.jsp").forward(request, response);
            
            }
            %>
        </div>
    </body>
</html>
