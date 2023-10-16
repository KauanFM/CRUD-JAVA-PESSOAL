<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Livros Dispon�veis</title>
        <link rel="stylesheet" href="tabela1.css"/>
    </head>
    <body>
        
	<%
        try { // Tratando Exce��es

            //Fazer a conex�o com o Banco de Dados //
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "jojokau8871");

            //Listar os dados da tabela produto do banco de dados //
            st = conecta.prepareStatement("SELECT * FROM livro");
            ResultSet rs = st.executeQuery();
    	%>

    <table border="1">
        <tr>
            <th>C�digo</th><th>ISBN</th><th>Nome</th><th>Autor(a)</th><th>Editora</th><th>G�nero</th><th>Descri��o</th><th>Pre�o</th><th>Exclus�o</th><th>Altera��o</th>
        </tr>                
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("ID")%></td>
            <td><%= rs.getInt("ISBN")%></td>
            <td><%= rs.getString("nome")%></td>
            <td><%= rs.getString("autor")%></td>
            <td><%= rs.getString("editora")%></td>
            <td><%= rs.getString("genero")%></td>
            <td><%= rs.getString("descricao")%></td>
            <td><%= rs.getString("preco")%></td>
            <td><a href="exclivros.jsp?isbn=<%= rs.getString("isbn")%>" id="ex" >Excluir</a></td>
            <td><a href="carregalivro.jsp?isbn=<%= rs.getString("isbn")%>" id="alt">Alterar</a></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } catch (Exception x) {
            out.print("Mensagem de erro: " + x.getMessage());
        }

    %>


    </body>
</html>
