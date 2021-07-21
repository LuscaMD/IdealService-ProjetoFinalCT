<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EsqueciSenha.aspx.cs" Inherits="IdealService.EsqueciSenha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/fundo.css" rel="stylesheet" />
    <link href="Css/textosBgDark.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
        <div class="bg-dark">
            <article class="card-body mx-auto" style="max-width: 400px;">
                <!-- Crie sua conta -->
                <br />
                <br />
                <h2 class="card-title mt-3 text-center texto">Recuperar a senha</h2>
                <asp:Label ID="lblMsg" Style="color: red;" runat="server" CssClass="text text-info label"></asp:Label>
                <form>

                    <br />

                    <!-- Digitar Email -->
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="texto" ID="lblEmail" title="Seu email">Email:</asp:Label>
                        <asp:RequiredFieldValidator ID="rfvEmail" ControlToValidate="txtEmail"
                            ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtEmail" runat="server" MaxLength="100"
                            CssClass="form-control" type="email" placeholder="Digite o seu email." title="Digite seu email."></asp:TextBox>
                    </div>
                    <!-- Selecionar DDD e digitar numero -->
                    <div class="form-group">
                        <label class="texto" title="Código">Código:</label>
                        <asp:TextBox ID="txtCodigo" runat="server" MaxLength="40"
                            CssClass="form-control" placeholder="Digite o seu código" type="number" title="Digite o seu código"></asp:TextBox>
                    </div>
                    <!-- Botão Criar conta -->
                    <div class="form-group">
                        <asp:Button ID="btnEnviar" CssClass="btn btn-primary btn-block" runat="server" Text="Enviar email" title="Enviar email" OnClick="btnEnviar_Click" />
                        <asp:Button ID="btnTrocar" CssClass="btn btn-primary btn-block" runat="server" Text="Trocar a senha" title="Trocar a senha" OnClick="btnTrocar_Click" />
                    </div>
                    <!-- Já tem uma conta? Logar -->
                    <p class="text-center texto">Lembrou a senha? <a href="Login.aspx">Logar</a> </p>

                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </form>
            </article>
        </div>
    </body>
</asp:Content>
