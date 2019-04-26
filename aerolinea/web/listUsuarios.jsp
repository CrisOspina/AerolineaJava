<%@page import="java.sql.*"%> <!--librerias-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de usuarios</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="background-color:#E0F8F7">
        <div class="container">
            <hr>
            <h1 class="" align="center">Listado de usuarios</h1>
            <hr>
            <table class="table table-striped">               
                <tr>
                    <th>Cédula</th>
                    <th>Nombre</th>
                    <th>Edad</th>
                    <th>E-mail</th>
                    <th>Celular</th>
                    <th>Ciudad</th>
                    <th>Viajes</th>
                    <th>Acción 1</th>
                    <th>Acción 2</th>
                </tr>
                
                <%
                    //conexión a mysql
                    //declaracion de variables para la conexión
                    Connection cnx=null; //conexion
                    Statement sta=null; //sta para ejecutar las sentencias sql
                    ResultSet rs=null; //rs para almacenar consulta
                    
                    //inicializacion del driver
                    try{ //por si genera algun error
                        //driver del mysql
                        Class.forName("com.mysql.jdbc.Driver");
                        //cadena de conexión almacenada en la variable cnx
                        cnx=DriverManager.getConnection("jdbc:mysql://localhost/aerolineaBD?user=root&password=");
                        //inicializacion del statement
                        sta=cnx.createStatement();
                        //ejecutar sentencia sql
                        rs=sta.executeQuery("select * from usuarios"); //ejecucion
                        //vaciar info en la pagina
                        while(rs.next()){ 
                        //mientras el rs (consulta) tenga datos imprima la columna 1,2,3,4,5,6,7 y se coloca por fila
                            %>
                            <tr>
                                <th><%=rs.getString(1)%></th>
                                <th><%=rs.getString(2)%></th>
                                <th><%=rs.getInt(3)%></th>
                                <th><%=rs.getString(4)%></th>
                                <th><%=rs.getInt(5)%></th>
                                <th><%=rs.getString(6)%></th>
                                <th><%=rs.getString(7)%></th>
                                <th><a href="actualizar.jsp?ced=<%=rs.getString(1)%>">Actualizar</a></th>
                                <th><a href="eliminar.jsp?ced=<%=rs.getString(1)%>">Eliminar</a></th>
                            </tr>
                            
                            <%
                        }
                        //cierre de variables de conexion
                        sta.close();
                        rs.close();
                        cnx.close();
                        //se agrega la libreria jar para la conexion
                        //mysql conector java
                    }catch(Exception e){}
                %>
            </table>
            <div class="" align="center">
                <a href="regUsuarios.jsp">Nuevo usuario</a> ---- 
                <a href="index.jsp">Inicio</a>
            </div>
        </div>
    </body>
</html>
