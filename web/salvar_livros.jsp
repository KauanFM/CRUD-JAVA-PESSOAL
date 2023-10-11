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
        
            // Recebendo os parâmetros do cadastro de produtos //
            int codigo;
            String nome, autor, descricao, editora, genero;
            double preco;
            
            codigo = Integer.parseInt(request.getParameter("codigo"));
            nome = request.getParameter("nome");
            autor = request.getParameter("autor");
            editora = request.getParameter("editora");
            genero = request.getParameter("genero");
            descricao = request.getParameter("descricao");
            preco = Double.parseDouble(request.getParameter("preco"));
            
            try { // Tratando Exceções 
            
                //Fazer a conexão com o Banco de Dados //
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "jojokau8871");

                //inserir os dados na tabela produto do banco de dados //
                st = conecta.prepareStatement("INSERT INTO livro VALUES(?,?,?,?,?,?,?)");
                st.setInt(1, codigo);
                st.setString(2, nome);
                st.setString(3, autor);
                st.setString(4, editora);
                st.setString(5, genero);
                st.setString(6, descricao);
                st.setDouble(7, preco);
                st.execute(); // Executa o comando sql INSERT
                out.print("Produto cadastrado com sucesso");
            } catch (Exception x) {
                String erro = x.getMessage();
                if(erro.contains("Duplicate entry")){
                    out.print("Esse nome já está cadastrado.");
                } else {
                    out.print("Erro: " + erro);
                }
                
            }
            
            
        %>
    </body>
</html>
