<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CentralDeAjuda.aspx.cs" Inherits="IdealService.CentralDaAjuda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <link href="Css/FaqSuporte.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <br />
        <br />
        <h1 style="text-align: center; color: white;">Dúvidas por categorias</h1>
        <br />
        <div class="row">
            <div class="col-sm-6">
                <div class="card" style="justify-content:center; text-align: center;">
                    <div class="card-body">
                        <h3 class="card-title">Minha Conta - <i class="fas fa-user-circle"></i></h3>
                        <p class="card-text">Perguntas relacionadas sobre a sua conta?</p>
                        <a href="FaqMinhaConta.aspx" class="btn btn-primary">Clique aqui</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card" style="justify-content:center; text-align: center;">
                    <div class="card-body">
                        <h3 class="card-title">Anúncios - <i class="fas fa-briefcase"></i></h3>
                        <p class="card-text">Perguntas relacionadas aos anuncios?</p>
                        <a href="FaqAnuncios.aspx" class="btn btn-primary">Clique aqui</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container py-5">
        <div class="card">
            <div class="card-body">
                <h3 style="text-align: center;">Não encontrou o que buscava? Nos envie uma mensagem.</h3>
                <!-- Div títúlo -->
                <div class="form-row">
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
                        <!-- Título -->
                        <label title="Assunto">Assunto:</label>
                        <asp:RequiredFieldValidator ID="rfvAssunto" ControlToValidate="txtAssunto"
                            ErrorMessage="*" ForeColor="Red" runat="server">
                        </asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtAssunto" runat="server" MaxLength="100"
                            CssClass="form-control" placeholder="Sua duvida">
                        </asp:TextBox>
                    </div>
                </div>
                <!-- Div Descrição -->
                <div class="form-row">
                    <!-- Descrição -->
                    <div class="form-text col-lg-12 col-md-12 col-sm-12 col-12">
                        <label title="Mensagem">Mensagem:</label>
                        <asp:RequiredFieldValidator ID="rfvMensagem" ControlToValidate="txtMensagem"
                            ErrorMessage="*" ForeColor="Red" runat="server">
                        </asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtMensagem" TextMode="MultiLine" Rows="5" runat="server" MaxLength="1000" CssClass="form-control"
                            placeholder="Explique aqui suas duvidas / problemas.">
                        </asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="form-row">
                    <div class="text-right col-md-12">
                        <asp:Button ID="btnEnviarDuvida" CssClass="btn btn-primary" runat="server" Text="Enviar duvida" OnClick="btnEnviarDuvida_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>