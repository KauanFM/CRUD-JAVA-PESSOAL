<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                margin: 0 auto;
                text-align: center;
                font-size: 50px;
                color: white;
                margin-top: 30px
            }
        </style>
    </head>
    <body>
         <%

            //Recebe o código do formulário.
            Integer isbn = Integer.parseInt(request.getParameter("isbn"));

            //Conexão com o Banco de Dados.
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "jojokau8871");

                //Enviando a query para o MySQL e executando.
                PreparedStatement st = conecta.prepareStatement("DELETE FROM livro WHERE ISBN = ?");
                st.setInt(1, isbn);
                st.executeUpdate();
                out.print("Livro excluido com sucesso!");
            } catch (Exception x) {
                String erro = x.getMessage();
                out.print("Mensagem de erro:" + erro);
            }


        %>

    </body>
</html>
