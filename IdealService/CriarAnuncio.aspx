<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CriarAnuncio.aspx.cs" Inherits="IdealService.CriarAnuncio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="Models/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="Models/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="Models/js/jquery.mask.min.js"></script>
    <title>Criar Anuncio</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="headling pb-5 bg-dark">
        <div class="container py-5">
            <div class="card">
                <div class="card-body">
                    <h1 class="font-weight-light text-center py-3">Cadastro de Prestador de Serviço</h1>

                    <!-- Div títúlo -->
                    <div class="form-row">
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
                            <!-- Título -->
                            <label title="Título">Título:</label>
                            <asp:RequiredFieldValidator ID="rfvTitulo" ControlToValidate="txtTitulo"
                                ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtTitulo" runat="server" MaxLength="100"
                                CssClass="form-control" placeholder="Título"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <!-- Telefone -->
                        <div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
                            <label title="Telefone">Telefone:</label>
                            <asp:RequiredFieldValidator ID="rfvTelefone" ControlToValidate="txtTelefone"
                                ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtTelefone" runat="server" type="number" MaxLength="14" CssClass="form-control"
                                placeholder="16912345678"></asp:TextBox>
                        </div>
                        <div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
                            <!-- Tipo de serviço -->
                            <label title="Tipo de serviço">Tipo de serviço:</label>
                            <asp:RequiredFieldValidator ID="rfvServico" ControlToValidate="txtServico"
                                ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="txtServico" ControlToValidate="txtServico"
                                CssClass="form-control" runat="server">
                                <asp:ListItem Selected="True" Value="">Selecione</asp:ListItem>
                                <asp:ListItem Value="Diarista">Diarista</asp:ListItem>
                                <asp:ListItem Value="Pedreiro">Pedreiro</asp:ListItem>
                                <asp:ListItem Value="Eletricista">Eletricista</asp:ListItem>
                                <asp:ListItem Value="Marceneiro">Marceneiro</asp:ListItem>
                                <asp:ListItem Value="Calheiro">Calheiro</asp:ListItem>
                                <asp:ListItem Value="Pintor">Pintor</asp:ListItem>
                                <asp:ListItem Value="Encanador">Encanador</asp:ListItem>
                                <asp:ListItem Value="Vidraceiro">Vidraceiro</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <!-- Div Descrição -->
                    <div class="form-row">
                        <!-- Descrição -->
                        <div class="form-text col-lg-12 col-md-12 col-sm-12 col-12">
                            <label title="Descrição">Descrição:</label>
                            <asp:RequiredFieldValidator ID="rfvDescrição" ControlToValidate="txtDescricao"
                                ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtDescricao" TextMode="MultiLine" Rows="5" runat="server" MaxLength="1000" CssClass="form-control"
                                placeholder="Descrição"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <!-- Descrição -->
                        <div class="form-text col-lg-6 col-md-12 col-sm-12 col-12">
                            <label title="CEP">CEP:</label>
                            <asp:RequiredFieldValidator ID="rfvCep" ControlToValidate="txtCep"
                                ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtCep" runat="server" MaxLength="9" CssClass="form-control"
                                placeholder="CEP"></asp:TextBox>
                            </div>
                            <div class="form-text col-lg-6 col-md-12 col-sm-12 col-12">
                            <label title="Cidade">Cidade:</label>
                            <asp:TextBox ID="txtCidade" runat="server" CssClass="form-control"
                                placeholder="Cidade" Enabled="false"></asp:TextBox>
                        </div>
                    </div>
                    <br>
                    <!-- Div upload (foto) -->
                    <div class="form-row">
                        <div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
                            <!-- Foto -->
                            <label title="Escolher Imagens de perfil">Escolher foto de perfil para o anúncio:</label>
                            <div class="center">
                     
                                <asp:FileUpload ID="FUPerfil" runat="server"  accept="image/png, image/jpeg, image/jfif" ></asp:FileUpload> 
                                     
                           </div>
                        </div>
                        <div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
                            <!-- Imagem -->
                            <label title="Escolher Imagens para seu anuncio">Escolher imagens(s) para o anúncio:</label>
                            <div class="center">

        
                                <asp:FileUpload ID="FUFoto" runat="server" AllowMultiple="true" accept="image/png, image/jpeg" ></asp:FileUpload> 
                                   
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <br>
                    <!-- Botão -->
                    <div class="form-row">
                        <div class="text-right col-md-12">
                            <!-- Cadastrar -->
                            <asp:Label ID="lblResultado" runat="server"></asp:Label>
                            <asp:Button ID="btnValidarCEP" CssClass="btn btn-primary" runat="server" Text="Validar dados" OnClick="btnValidar_Click"  />
                            <asp:Button ID="btnCriar" CssClass="btn btn-primary" runat="server" Text="Criar anuncio" OnClick="btnCriar_Click"  />
                        </div>
                    </div>
                    <!-- Div Resultado -->
                    <div class="form-row">
                        <div class="text-right col-md-12">
                            <!-- Resultado -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style>

.teste {
        opacity:0; 
       }   


 .button {
  background-color:blue;
  border: none;
  color: white;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
.button1 {padding: 5px 0px;}
    </style>

       
</asp:Content>
