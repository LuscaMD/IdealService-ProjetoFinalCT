<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EditarConta.aspx.cs" Inherits="IdealService.EditarConta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="Models/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="Models/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="Models/js/jquery.mask.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="headling pb-5 bg-dark">
        <br />
        <br />
        <div class="container py-2">
            <div class="card">
                <div class="card-body">
                    <h1 class="font-weight-light text-center py-3">Editar Perfil</h1>
                    <!-- Div nome -->
                    <div class="form-row">
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
                            <!-- Nome -->
                            <label>Nome:</label>
                            <asp:RequiredFieldValidator ID="rfvNome" ControlToValidate="txtNome"
                                ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtNome" runat="server" MaxLength="100"
                                CssClass="form-control" placeholder="Nome"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <!-- Email -->
                        <div class="form-group col-lg-5 col-md-12 col-sm-12 col-12">
                            <label>Email:</label>
                            <asp:RequiredFieldValidator ID="rfvEmail" ControlToValidate="txtEmail"
                                ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtEmail" runat="server" type="email" MaxLength="100" CssClass="form-control"
                                placeholder="Email"></asp:TextBox>
                        </div>
                        <!-- Senha -->
                        <div class="form-group col-lg-3 col-md-12 col-sm-12 col-12">
                            <label>Senha:</label>
                            <asp:RequiredFieldValidator ID="rfvSenha" ControlToValidate="txtSenha"
                                ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtSenha" runat="server" MaxLenght="100" CssClass="form-control" type="password"
                                placeholder="Senha"></asp:TextBox>
                        </div>
                        <!-- TELEFONE -->
                        <div class="form-group col-lg-4 col-md-12 col-sm-12 col-12">
                            <label>Telefone:</label>
                            <asp:RequiredFieldValidator ID="rfvTelefone" ControlToValidate="txtTelefone"
                                ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtTelefone" runat="server" type="number" MaxLength="14" CssClass="form-control"
                                placeholder="16 91234 5678" value="" Enabled="true"></asp:TextBox>
                        </div>
                    </div>
                    <!-- Div Cidade / Estado -->
                    <div class="form-row">
                        <div class="form-group col-lg-8 col-md-8 col-sm-8 col-8">
                            <!-- CEP -->
                            <div class=" text-left">
                                
                                <label>CEP:</label>
                                <asp:Label ID="lblCEP" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="rfvCep" ControlToValidate="txtCep"
                                    ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtCep" runat="server" MaxLength="8" CssClass="form-control"
                                    placeholder="CEP" value="" Enabled="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-lg-3 col-md-3 col-sm-3 col-3">
                            <!-- Cidade -->
                            <label>Cidade:</label>
                            <asp:TextBox ID="txtCidade" runat="server" MaxLenght="100" CssClass="form-control"
                                placeholder="Cidade" value="" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="form-group col-lg-1 col-md-1 col-sm-1 col-1">
                            <!-- Estado -->
                            <label>Estado:</label>
                            <asp:TextBox ID="txtEstado" runat="server" MaxLenght="100" CssClass="form-control"
                                placeholder="Estado" value="" Enabled="false"></asp:TextBox>
                        </div>
                    </div>
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
                            <asp:Button ID="btnVoltar" CssClass="btn btn-primary" runat="server" Text="Voltar" OnClientClick="JavaScript:window.history.back(1); return false;" />
                            <asp:Button ID="btnAtualizar" CssClass="btn btn-primary" runat="server" Text="Atualizar dados" OnClick="btnAtualizar_Click" />
                        </div>
                    </div>
                    <!-- Div Resultado -->
                </div>
            </div>
        </div>

    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        function previewImagem() {

        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#txtCpf").mask("000.000.000-00")
        })
    </script>
</asp:Content>

