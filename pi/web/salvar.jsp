<%-- 
    Document   : salvar
    Created on : 16 de out. de 2023, 20:04:10
    Author     : gegeg
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function redirectAfterDelay() {
                window.location.href = "index.html";
            }
        </script>
    </head>
    <body>
        <%
            //receber dados
            String temperatura, horario, estado;
            Double umidade;
            horario = request.getParameter("horario");
            temperatura = request.getParameter("temperatura");
            umidade = Double.parseDouble(request.getParameter("umidade"));
            estado = request.getParameter("estado");
            
            try{
            //fazer a conexão
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "008073");
            st = conecta.prepareStatement("insert into estacao (horario,temperatura,estado,umidade) values(?,?,?,?)");
            st.setString(1, horario);
            st.setString(2, temperatura);
            st.setString(3, estado);
            st.setDouble(4, umidade);
            st.executeUpdate();
            out.print("CADASTRO CONCLUIDO");
            } catch (Exception x){
             out.print("Mensagem de erro:" + x.getMessage());
            }
            // Call the redirect function after a delay
            out.println("<script>setTimeout(redirectAfterDelay, 2000);</script>");
        %>  
    </body>
</html>
