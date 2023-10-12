<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Alterar Livro</title>
        <link rel="stylesheet" href="carregalivro.css"/>
    </head>
    <body> 
       <%

            // Recebendo os par�metros alterados do formulario carregaprod.jsp 
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            String nome = request.getParameter("nome");
            String autor = request.getParameter("autor");
            String editora = request.getParameter("editora");
            String genero = request.getParameter("genero");
            String descricao = request.getParameter("descricao");
            double preco = Double.parseDouble(request.getParameter("preco"));

            try { // Tratando Exce��es 
            
                //Fazer a conex�o com o Banco de Dados //
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "jojokau8871");

                //alterar os dados na tabela produto do banco de dados //
                st = conecta.prepareStatement("UPDATE livro SET nome = ?, autor = ?, editora = ?, genero = ?, descricao = ?, preco = ? WHERE codL = ?");
                st.setString(1, nome);
                st.setString(2, autor);
                st.setString(3, editora);
                st.setString(4, genero);
                st.setString(5, descricao);
                st.setDouble(6, preco);
                st.setInt(7, codigo);
                st.executeUpdate(); // Executa o comando sql INSERT
                out.print("Produto alterado com sucesso!");
                
            } catch (Exception x) {
                String erro = x.getMessage();
                out.print("Erro: " + erro); 
            }


        %>
    </body>
</html>
