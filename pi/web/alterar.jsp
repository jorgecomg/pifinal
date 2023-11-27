<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Alterar Registro</title>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css" />
   <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@500&display=swap" rel="stylesheet">
    </head>
    <body>
        <header>
        <h1>Estação Metereológica</h1>
        <nav>
        <ul>
            <!--<li><a href = "index.html">Cadastro</a></li>-->
            <li><a href = "produtos.jsp">Registros</a></li>
            <li><a href = "excluirprod.html">Excluir Registro</a></li>
            <li><a href = "alterar.html">Alterar Registro</a></li>
            <li><a href="excel.jsp">Cadastrar via Excel</a></li>
        </ul>
    </nav>
    </header>
   
    
   
        
            
        
        <%
        int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));
             HttpSession sessione = request.getSession();
             sessione.setAttribute("codigoalt", cod);
            try {
                //Conecta ao banco de dados chamado banco
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "008073");
                // Excluem o produto de código informado
                PreparedStatement st = conecta.prepareStatement("SELECT * FROM estacao WHERE id=?");
                st.setInt(1, cod);
                ResultSet rs = st.executeQuery(); // Executa o comando SELECT
                   if (!rs.next()) { %>
    
    <h2>Este registro não existe.</h2>
    <%
} else {
    %>
    <form method="post" action="alterar2.jsp">
        <h2>horario:</h2>
        <input type = "text" id = "horario" name = "horario" value="<%= rs.getString("horario")%>">
        <h2>temperatura:</h2>
        <input type = "text" id = "temperatura" name = "temperatura" value="<%= rs.getString("temperatura")%>">
        <h2>umidade:</h2>
        <input type = "text" id = "temperatura" name = "temperatura" value="<%= rs.getString("umidade")%>">
        <h2>estado:</h2>
        <input type = "text" id = "estado" name = "estado" value="<%= rs.getString("estado")%>">
        <p><input type="submit" value = "Alterar" id = "submitButton">
    <%
}
            } catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                out.print("Entre em contato com o suporte e informe o erro " + mensagemErro);
            }
        %>
        
        </form>
        
    
    </body>
</html>