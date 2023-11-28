<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir produtos</title>
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
            cod = Integer.parseInt(request.getParameter("codigo"));
            try {
                //Conecta ao banco de dados chamado banco
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "56150122");
                // Excluem o produto de código informado
                PreparedStatement st = conecta.prepareStatement("DELETE FROM estacao WHERE id=?");
                st.setInt(1, cod);
                int resultado = st.executeUpdate(); // Executa o comando DELETE
                //Verifica se o produto foi ou  não excluído
                if (resultado == 0) {
                    out.print("Este registro não existe");
                } else {
                    out.print("O registro de código " + cod + " foi excluído com sucesso");
                }
            } catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                out.print("Entre em contato com o suporte e informe o erro " + mensagemErro);
            }
            out.println("<script>setTimeout(redirectAfterDelay, 2000);</script>");
        %>   
    </body>
</html>

