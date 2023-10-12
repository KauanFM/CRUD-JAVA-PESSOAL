<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%

            //Recebe o código do formulário.
            int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));

            //Conexão com o Banco de Dados.
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "jojokau8871");

                //Enviando a query para o MySQL e executando.
                PreparedStatement st = conecta.prepareStatement("DELETE FROM livro WHERE codL = ?");
                st.setInt(1, cod);
                st.executeUpdate();
                out.print("Produto excluido com sucesso!");
            } catch (Exception x) {
                String erro = x.getMessage();
                out.print("Mensagem de erro:" + erro);
            }


        %>

    </body>
</html>
