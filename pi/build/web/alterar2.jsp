<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Registro</title>
        <script>
            function redirectAfterDelay() {
                window.location.href = "index.jsp";
            }
        </script>
    </head>
    <body>
        <%
            // Recebe o código digitado no formulário
            int cod;
            HttpSession sessione = request.getSession();
            Object attribute = sessione.getAttribute("codigoalt");
            cod = (Integer)attribute;
            try {
                //Conecta ao banco de dados chamado banco
                String temperatura, horario, estado;
            Double umidade;
            horario = request.getParameter("horario");
            temperatura = request.getParameter("temperatura");
            umidade = Double.parseDouble(request.getParameter("umidade"));
            estado = request.getParameter("estado");
            
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "56150122");
                // Excluem o produto de código informado
                PreparedStatement st = conecta.prepareStatement("UPDATE estacao SET horario = ?, temperatura = ?, umidade = ?, estado = ? WHERE id = ?");
                st.setString(1, horario);
                st.setString(2, temperatura);
                st.setString(4, estado);
                st.setDouble(3, umidade);
                st.setInt(5, cod);
                st.executeUpdate();
            out.print("Alteração concluída");
            } catch (Exception x){
             out.print("Mensagem de erro:" + x.getMessage());
            }
            sessione.setAttribute("codigoalt", -1);
            // Call the redirect function after a delay
            out.println("<script>setTimeout(redirectAfterDelay, 2000);</script>");
        %>  
    </body>
</html>