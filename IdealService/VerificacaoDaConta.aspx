<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="VerificacaoDaConta.aspx.cs" Inherits="IdealService.VerificacaoDaConta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="Models/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="Models/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="Models/js/jquery.mask.min.js"></script>
    <title>Criar Anuncio</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="headling pb-5 bg-dark">
        <div class="container py-5">
            <br />
            <div class="card">
                <div class="card-body">
                    <h1 class="font-weight-light text-center py-3">Código</h1>
                    <br />

                    <!-- Div títúlo -->
                    <div class="form-row">
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
                            <!-- Título -->
                            <label title="Código">Digite o código que enviamos no seu email:</label>
                            <asp:RequiredFieldValidator ID="rfvConferir" ControlToValidate="txtConferir"
                                ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtConferir" runat="server" MaxLength="100"
                                CssClass="form-control" placeholder="Código"></asp:TextBox>
                            <div class="text-right">
                                <asp:Button runat="server" ID="btnVerificar" CssClass="btn btn-primary" Text="Verificar" OnClick="btnverificar_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
            </div>
        </div>
    </div>
    <br />
</asp:Content>
