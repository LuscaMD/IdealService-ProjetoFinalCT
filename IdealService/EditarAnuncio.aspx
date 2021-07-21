<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EditarAnuncio.aspx.cs" Inherits="IdealService.EditarAnuncio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="Models/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="Models/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="Models/js/jquery.mask.min.js"></script>
    <title>Editar Anuncio</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="headling pb-5 bg-dark">
        <div class="container py-5">
            <div class="card">
                <div class="card-body">
                    <h1 class="font-weight-light text-center py-3">Detalhes do anúncio:</h1>
                    <center>
                        <label><strong>Foto do perfil</strong></label>
                    </center>
                    <br />
                    <center>
                    <!-- Div Fotos-->
                    <div class="form-row" align="center">
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
                            <asp:Image ID="FUPerfil" CssClass="img-fluid" runat="server" Style="height: 250px; width: 275px; border-radius: 10px;" />
                        </div>
                    </div>
                    <br />
                    
                    <asp:Label runat="server" ID="lblImgAnuncios"><Strong>Imagens do anuncio</Strong></asp:Label>
                    </center>
                    <br>
                    <div class="form-row" align="center">
                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-4">
                            <asp:Image ID="FUFoto2" CssClass="img-fluid" runat="server" Style="height: 250px; width: 275px; border-radius: 10px;" />
                        </div>
                         <div class="form-group col-lg-4 col-md-4 col-sm-4 col-4">
                            <asp:Image ID="FUFoto1" CssClass="img-fluid" runat="server" Style="height: 250px; width: 275px; border-radius: 10px;" />
                        </div>
                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-4">
                            <asp:Image ID="FUFoto3" CssClass="img-fluid" runat="server" Style="height: 250px; width: 275px; border-radius: 10px;" />
                        </div>
                    </div>
                    <!-- Div Status -->
                    <div class="form-row">
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
                            <!-- Status --><h2><center>
                            <asp:label runat="server" ID="lblStatus"></asp:label></center></h2>
                        </div>
                    </div>
                    <!-- Div Títúlo -->
                    <div class="form-row">
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
                            <!-- Título -->
                            <label title="Título">Título</label>
                            <asp:TextBox ID="txtTitulo" runat="server" MaxLength="100"
                                CssClass="form-control" placeholder="Título">
                            </asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <!-- Telefone -->
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-6">
                            <label title="Telefone">Telefone:</label>
                            <asp:TextBox ID="txtTelefone" runat="server" type="number" MaxLenght="14" CssClass="form-control"
                                placeholder="Telefone">
                            </asp:TextBox>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-6">
                            <!-- Tipo de serviço -->
                            <label title="Selecione o tipo de serviço que você deseja anunciar">Tipo de serviço:</label>
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
                                <asp:ListItem Value="Vidreiro">Vidreiro</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <!-- Div Descrição -->
                    <div class="form-row">
                        <!-- Descrição -->
                        <div class="form-text col-lg-12 col-md-12 col-sm-12 col-12">
                            <label title="Descrição">Descrição:</label>
                            <asp:TextBox ID="txtDescricao" TextMode="MultiLine" Rows="5" runat="server" MaxLength="1000" CssClass="form-control"
                                placeholder="Descrição" Style="resize: none;">
                            </asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <!-- Descrição -->
                        <div class="form-text col-lg-6 col-md-6 col-sm-6 col-6">
                            <label title="Cep">CEP:</label>
                            <asp:TextBox ID="txtCep" runat="server" MaxLength="9" CssClass="form-control"
                                placeholder="CEP">
                            </asp:TextBox>
                        </div>
                        <div class="form-text col-lg-4 col-md-4 col-sm-4 col-4">
                            <label title="Cidade">Cidade:</label>
                            <asp:TextBox ID="txtCidade" runat="server" CssClass="form-control"
                                placeholder="Cidade" Enabled="false">
                            </asp:TextBox>
                        </div>
                        <div class="form-text col-lg-2 col-md-2 col-sm-2 col-2">
                            <label title="Estado">Estado:</label>
                            <asp:TextBox ID="txtEstado" runat="server" CssClass="form-control"
                                placeholder="Estado" Enabled="false">
                            </asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <!-- Div upload (foto) -->
                    <div class="form-row">
                        <div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
                            <!-- Foto -->
                            <label title="Mudar Imagens de perfil">Mudar foto de perfil para o anúncio:</label>
                            <div class="center">
                                <asp:FileUpload ID="FUPerfilEnviar" runat="server" accept="image/png, image/jpeg"></asp:FileUpload>
                            </div>
                        </div>
                        <div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
                            <!-- Imagem -->
                            <label title="Escolher Imagens para seu anuncio">Mudar imagens do anúncio:</label>
                            <div class="center">
                                <asp:FileUpload ID="FUFoto" runat="server" AllowMultiple="true" accept="image/png, image/jpeg"></asp:FileUpload>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <!-- Botões -->
                    <div class="form-row">
                        <div class="text-right col-md-12">
                            <asp:Button ID="btnExcluir" CssClass="btn btn-danger" runat="server" Text="Excluir anuncio" OnClick="btnExcluir_Click" />
                            <asp:Button ID="btnVoltar" CssClass="btn btn-primary" runat="server" Text="Voltar" OnClick="btnVoltar_Click" />
                            <asp:Button ID="btnValidarCEP" CssClass="btn btn-primary" runat="server" Text="Validar dados" OnClick="btnValidar_Click" />
                            <asp:Button ID="btnAtualizar" CssClass="btn btn-primary" runat="server" Text="Salvar alterações" OnClick="btnAtualizar_Click" />  
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="text-right col-md-12">
                            <div class="alert alert-muted">
                                <asp:Label  ID="lblFinal" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>