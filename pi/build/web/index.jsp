<%-- 
    Document   : produtos.html
    Created on : 16 de out. de 2023, 22:14:48
    Author     : gegeg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registros</title>
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
            <li><a href = "index.jsp">Registros</a></li>
            <li><a href = "excluirprod.html">Excluir Registro</a></li>
            <li><a href = "alterar.html">Alterar Registro</a></li>
            <li><a href="excel.jsp">Cadastrar via Excel</a></li>
        </ul>
    </nav>
    </header>
   
    
    <main>
        
           <div id = "tabelaDiv">
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Horario</th>
                        <th>Temperatura</th>
                        <th>Umidade</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <%
                    try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "56150122");
                //Listar os dados da tabela produto do banco de dados 
                st = conecta.prepareStatement("SELECT * FROM estacao");
                ResultSet rs = st.executeQuery();
                
                             
                
                while (rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getString("id")%></td>
                        <td><%= rs.getString("horario")%></td>
                        <td><%= rs.getString("temperatura")%> ºC</td>
                        <td><%= rs.getString("umidade")%>%</td>
                        <td><%= rs.getString("estado")%></td>
                    </tr>
               <%
               }
               %>
               </table>
               <%
        } catch (Exception x) {
            out.print("Mensagem de erro:" + x.getMessage());
        }


        %>  
                
           </div> 
    
    </main>
   

</body>
</html>
