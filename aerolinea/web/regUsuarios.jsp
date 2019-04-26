<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario de registro</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="background-color:#E0F8F7">
        <div class="container">
            <hr>
            <h1 class="" align="center">Aerolinea DreamCol</h1>
            
            <!--Formulario de registro de usuarios nuevos-->
            <form action="" name="" method="get">
                <div class="form-group">
                    Cedula: <input class="form-control" type="text" name="cedula" id=""/><br>
                    Nombres: <input class="form-control" type="text" name="nombres" id=""/><br>
                    Edad: <input class="form-control" type="text" name="edad" id=""/><br>
                    E-mail: <input class="form-control" type="text" name="email" id=""/><br>
                    Celular: <input class="form-control" type="text" name="celular" id=""/><br>
                    Ciudad: <input class="form-control" type="text" name="ciudad" id=""/><br>
                    Viaje: <select class="form-control" name="viaje">
                            <option value="nacional">Nacional</option>
                            <option value="internacional">Internacional</option>
                        </select><br>
                </div>
                <div align="center">
                    <input class="btn btn-primary" type="submit" name="btnregistrar" id="" value="Registrar"/>
                    <a href="index.jsp">Inicio</a>
                    <hr>
                </div>
            </form>
            
            
            <%  
                if(request.getParameter("btnregistrar")!=null)
                {
                    //recibiendo datos ingresados por el usuario
                    String ced=request.getParameter("cedula");
                    String nom=request.getParameter("nombres");
                    int ed=Integer.parseInt(request.getParameter("edad"));
                    String ema=request.getParameter("email");
                    String cel=request.getParameter("celular");
                    String ciu=request.getParameter("ciudad");
                    String via=request.getParameter("viaje");
                
                    //conexion, preparacion y ejecucion
                    Connection cnx=null;
                    Statement sta=null;
                    ResultSet rs=null;
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver"); //driver sql
                        cnx=DriverManager.getConnection("jdbc:mysql://localhost/aerolineaBD?user=root&password=");
                        sta=cnx.createStatement(); //preparacion para insertar
                        //insertar usuario nuevo
                        sta.executeUpdate("insert into usuarios values('"+ced+"','"+nom+"',"+ed+",'"+ema+"','"+cel+"','"+ciu+"','"+via+"')");
                        //verificacion de insercion
                        request.getRequestDispatcher("listUsuarios.jsp").forward(request, response);
                    }
                    catch(Exception e){out.println(e+"");}
                
                }
            %>
        </div>
    </body>
</html>
