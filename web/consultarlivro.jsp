<%-- 
    Document   : listapro
    Created on : 2 de out. de 2023, 19:16:46
    Author     : Mendes
--%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Produtos</title>
        <link rel="stylesheet" href="tabela.css"/>
    </head>

    <%
            //Recebendo o nome do produto
            String n = request.getParameter("nome");
            
            try { // Tratamento de exceções
            
                //Conexão com o Banco de Dados MySQL
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "jojokau8871");
                
                PreparedStatement st = conecta.prepareStatement("SELECT * FROM livro WHERE nome like ? ");
                st.setString(1, "%" + n + "%");
                ResultSet rs = st.executeQuery();
                
           
        %>
   <table border="1">
        <tr>
            <th>Código</th><th>Nome</th><th>Autor(a)</th><th>Editora</th><th>Gênero</th><th>Descrição</th><th>Preço</th>
        </tr>                
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("codL")%></td>
            <td><%= rs.getString("nome")%></td>
            <td><%= rs.getString("autor")%></td>
            <td><%= rs.getString("editora")%></td>
            <td><%= rs.getString("genero")%></td>
            <td><%= rs.getString("descricao")%></td>
            <td><%= rs.getString("preco")%></td>
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

</html>
