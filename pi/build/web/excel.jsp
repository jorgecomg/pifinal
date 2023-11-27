<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.io.BufferedReader" %>
<%@page import="java.io.FileReader" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro via Excel</title>
    </head>
    <body>
        <%
            String sql = "";
            PreparedStatement st;
            try {
                //Conecta ao banco de dados chamado banco
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "008073");
                //Ler o arquivo Excel
                FileReader arquivo = new FileReader("C:/csv/testecsv.csv");
                BufferedReader br = new BufferedReader(arquivo);
                String linha;
                //Se a linha lida do arquivo produtos.csv não estiver nula
                while ((linha = br.readLine()) != null) {
                    //Pegam os valores da linha do arquivo excel e joga em variáveis
                    String[] dados = linha.split(";");
                    //limpa o valor contido em dados[0] de caracteres ocultos
                    String horario = dados[0];
                    String temperatura = dados[1];
                    double umidade = Double.parseDouble(dados[2]);
                    String estado = dados[3];
                    //Busca pelo produto antes de inserir na tabela
                    
                    
                        sql = "INSERT INTO estacao (horario, temperatura, umidade, estado) VALUES(?,?,?,?)";
                        st = conecta.prepareStatement(sql);
                        st.setString(1, horario);
                        st.setString(2, temperatura);
                        st.setDouble(3, umidade);
                        st.setString(4, estado);
                        st.executeUpdate(); //Executa o comando insert
                        out.print("O registro de <b>" + horario + "</b> foi cadastrado com sucesso <br>");
                    
                }
                br.close();
            } catch (Exception erro) {
                out.print("Entre em contato com o suporte e informe o erro: " + erro.getMessage());
            }
        %>    
    </body>
</html>
