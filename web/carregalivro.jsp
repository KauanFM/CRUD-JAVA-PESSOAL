<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>carregalivro</title>
        <link rel="stylesheet" href="stylecad.css"/>        
    </head>
    <body>
        <%
            //Recebendo o código digitado
            int cod = Integer.parseInt(request.getParameter("codigo"));

            try { // Tratamento de Exceções

                //Conexão com o Banco de Dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "jojokau8871");

                //Busca o produto pelo código recebido
                PreparedStatement st = conecta.prepareStatement("SELECT * FROM livro WHERE codL = ?");
                st.setInt(1, cod);
                ResultSet rs = st.executeQuery();

                //Verifica se o produto de código informado foi encontrado
                if (!rs.next()) {
                    out.print("Produto não encontrado");
                } else {
        %>
        <main>
            <div class="container">
                <form method="post" action="alterar_livros.jsp">


                    <label for="codigo">Código:</label>
                    <input type="number" step="1" name="codigo" id="codigo" value="<%= rs.getInt("codL")%>" readonly>



                    <label for="nome">Nome:</label>
                    <input type="text" name="nome" id="nome" size="50" maxlength="50" value="<%= rs.getString("nome")%>" required>



                    <label for="autor">Autor(a):</label>
                    <input type="text" name="autor" id="autor" size="50" maxlength="50" value="<%= rs.getString("autor")%>" required>



                    <label for="editora">Editora:</label>
                    <input type="text" name="editora" id="editora" size="50" maxlength="50" value="<%= rs.getString("editora")%>" required>



                    <label for="genero">Gênero:</label>
                    <input type="text" name="genero" id="genero" size="50" maxlength="50" value="<%= rs.getString("genero")%>" required>



                    <label for="descricao">Descrição:</label>
                    <input type="text" name="descricao" id="descricao" size="50" maxlength="2000" value="<%= rs.getString("descricao")%>" required>



                    <label for="preco">Preço:</label>
                    <input type="number" step="0.5" name="preco" id="preco" value="<%= rs.getString("preco")%>" required>



                    <input type="submit" value="Salvar Alterações">

                </form>
            </div>
        </main>
        <%
                }

            } catch (Exception x) {
                String erro = x.getMessage();
                out.print("Mensagem de erro: " + erro);
            }


        %>
    </body>
</html>
