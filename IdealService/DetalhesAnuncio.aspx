<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" EnableEventValidation="true" CodeBehind="DetalhesAnuncio.aspx.cs" Inherits="IdealService.DetalhesAnuncio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Detalhes Anuncio</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container py-2">
        <div class="card">
            <div class="card-body">
                <h1 class="font-weight-light text-center py-3">Detalhes do anuncio:</h1>
                <center>
                    <label><strong>Foto do perfil</strong></label>
                       </center>
                <br />
                <!-- Div Fotos-->
                <div class="form-row" align="center">
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">

                        <asp:Image ID="FUPerfil" CssClass="img-fluid" runat="server" Style="height: 250px; width: 275px; border-radius: 10px;" />
                    </div>
                </div>
                <br />
                <center>
                        <asp:label runat="server" ID="lblImgAnuncios"><strong>Imagens do anuncio</strong></asp:label>
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
                <!-- Div Títúlo -->
                <div class="form-row">
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
                        <!-- Título -->
                        <label title="Título">Título</label>
                        <asp:TextBox ID="txtTitulo" runat="server" MaxLength="100"
                            CssClass="form-control" placeholder="Título" Enabled="false">
                        </asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <!-- Telefone -->
                    <div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
                        <label title="Telefone">Telefone:</label>
                        <asp:TextBox ID="txtTelefone" runat="server" MaxLenght="14" CssClass="form-control"
                            placeholder="Telefone" Enabled="false">
                        </asp:TextBox>
                    </div>
                    <div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
                        <!-- Tipo de serviço -->
                        <label title="Selecione o tipo de serviço que você deseja anunciar">Tipo de serviço:</label>
                        <asp:DropDownList ID="txtServico" ControlToValidate="txtServico"
                            CssClass="form-control" runat="server" Enabled="false">
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
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
                        <label title="Descrição">Descrição:</label>
                        <asp:TextBox ID="txtDescricao" TextMode="MultiLine" Rows="5" runat="server" MaxLength="1000" CssClass="form-control"
                            placeholder="Descrição" Enabled="false" Style="resize: none;">
                        </asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <!-- Descrição -->
                    <div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
                        <label title="Cep">CEP:</label>
                        <asp:TextBox ID="txtCep" runat="server" MaxLength="9" CssClass="form-control"
                            placeholder="CEP" Enabled="false">
                        </asp:TextBox>
                    </div>
                    <div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
                        <label title="Cidade">Cidade:</label>
                        <asp:TextBox ID="txtCidade" runat="server" CssClass="form-control"
                            placeholder="Cidade" Enabled="false">
                        </asp:TextBox>
                    </div>
                </div>
                <!-- Botão -->
                <div class="form-row">
                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-6" runat="server" id="divwpp" visible="true">
                        <label title="Descrição">Se interessou? Mande uma mensagem.</label>
                        <asp:TextBox ID="txtMensagem" TextMode="MultiLine" Rows="3" runat="server" MaxLength="1000" CssClass="form-control"
                            placeholder="Olá, me interessei pelos seus serviços!!" Style="resize: none; position: relative; bottom: 0;">
                        </asp:TextBox>
                    </div>
                    <center>
                        <br />
                        <br />
                    <div class="form-group text-right col-lg-6 col-md-6 col-sm-6 col-6" style="position: absolute; bottom: 0; right: 0;">
                        <style>
                            .btn-green {
                                background-color: #00c851 !important;
                            }

                                .btn-green:hover, .btn-green:focus, .btn-green:active {
                                    background-color: #218838 !important;
                                    border-color: #1e7e34 !important;
                                }
                        </style>
                        <br />
                        <br />
                        <!-- LblResultado / Cadastrar -->
                        <asp:Label ID="lblResultado" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:LinkButton ID="btnWpp" CssClass="btn btn-green" BackColor="#00c851" runat="server" OnClick="btnWpp_Click">Enviar mensagem   <i class="fab fa-whatsapp"></i></asp:LinkButton>
                        <asp:Button ID="btnVoltar1" CssClass="btn btn-primary" runat="server" Text="Voltar" OnClick="btnVoltar_Click1" />
                        <asp:Button ID="btnReprovar" CssClass="btn btn-danger" runat="server" Text="Reprovar" OnClick="btnReprovar_Click" />
                        <asp:Button ID="btnAprovar" CssClass="btn btn-success" runat="server" Text="Aprovar" OnClick="btnAprovar_Click" />
                        <asp:Button ID="btnExcluir" CssClass="btn btn-danger" runat="server" Text="Excluir" OnClick="btnExcluir_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div class="container py-3" id="divcomentario" runat="server" visible="true">
            <div class="card">
                <div class="card-body">
                    <center><asp:Label runat="server" ID="lblComentario">
                        <h2>Comentários</h2></asp:Label> 
                        <br />
                    <asp:button runat="server" CssClass="btn btn-primary" ID="btnComentarios" Text="Ver comentários" OnClick="btnComentarios_Click" />
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-6">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtComentario" style="margin=2px;" placeholder="Comente Aqui!!!"></asp:TextBox>
                        <br />
                        <asp:Button runat="server" CssClass="btn btn-primary" ID="btnComentar" style="margin=2px;" Text="Publique seu comentário !" OnClick="btnComentar_Click"/>
                        <br />
                        </div>
                    </center>
                    <asp:Repeater ID="rptComentarios" runat="server">
                        <HeaderTemplate>
                            <table class="table table-hover" id="sisDataTable">
                                <thead>
                                    <tr>
                                    </tr>
                                </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="shadow-lg p-3 mb-5 bg-white rounded"">
                                <div>
                                    <h3>
                                        <asp:Label runat="server" CssClass="label dark-ic" ID="lblnome" Text='<%# Eval("nome") %>'></asp:Label>
                                        <i title="Email verificado" class="far fa-check-circle blue-ic"></i>
                                </div>
                                <asp:Label runat="server" CssClass="label  dark-ic" ID="lblcomentario" Text='<%# Eval("comentario") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div class="row">
                        <div class="col-md-12">
                            <center>
                                <asp:Button ID="btnVoltar" CssClass="btn btn-primary" runat="server" Text="Voltar" OnClick="btnVoltar_Click" />
                                <asp:Button ID="btnProximo" CssClass="btn btn-primary" runat="server" Text="Proximo" OnClick="btnProximo_Click" />    
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <br />
</asp:Content>
