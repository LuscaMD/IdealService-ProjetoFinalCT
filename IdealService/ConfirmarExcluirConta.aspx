<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ConfirmarExcluirConta.aspx.cs" Inherits="IdealService.ConfirmarExcluirConta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/textosBgDark.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-dark">
        <article class="card-body mx-auto" style="max-width: 400px;">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <!-- Crie sua conta -->
            <h2 class="card-title mt-3 text-center texto">Você tem certeza que quer excluir sua conta?</h2>
            <div class="form-row">
                <div class="text-right col-md-12">
                    <!-- Resultado -->
                    <asp:Label ID="lblResultado" runat="server"></asp:Label>
                </div>
            </div>
            <!-- Div Botões -->
            <div class="form-row">
                <div class="text-right col-md-12">
                    <!-- Excluir conta / Validar / Cadastrar -->
                    <asp:Button ID="btnExcluir" CssClass="btn btn-danger" runat="server" Text="Excluir conta" OnClick="btnExcluir_Click" />
                    <asp:Button ID="btnVoltar" CssClass="btn btn-primary" runat="server" Text="Cancelar" OnClick="btnVoltar_Click" />
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </article>
    </div>
</asp:Content>
