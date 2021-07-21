<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PADM.aspx.cs" Inherits="IdealService.PADM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <title>Prestadores de Serviço</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="headling pb-5 bg-dark">
        <div class="container py-5">
            <div class="card">
                <div class="card-body">
                    <div class="col-md-12">
                        <div class="bg-primary text-white shadow-lg p-3 mb-5 bg-white rounded">
                            <h2 class="font-weight-light text-center py-4">
                                <asp:Label runat="server" ID="lblTitulo">Listagem de Prestadores Pendentes</asp:Label></h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:TextBox ID="txtProcurar" runat="server" MaxLength="100"
                                CssClass="form-control" placeholder="Procurar" style="border:1px solid black;"></asp:TextBox>
                            <div class="text-right">
                                <asp:Button ID="btnProcurar" CssClass="btn btn-primary"  runat="server" Text="Procurar" OnClick="btnProcurar_Click" />
                            </div>
                        </div>
                    </div>
                    <p>
                        <asp:Repeater ID="rptPrestadores" runat="server">
                            <HeaderTemplate>
                                <table class="table table-hover" id="sisDataTable">
                                    <thead>
                                        <tr>
                                        </tr>
                                    </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    </td> 
                                <!-- class="card col-md-12" = mudar o tamanho do card!-->
                                    <div class="card col-md-12" style="width: 100%">
                                        <div class="card-body">
                                            <p class="card-text" aria-valuetext="12">
                                                <asp:Image ID="FUPerfil" CssClass="img-fluid" runat="server" src='<%# Eval("imgPerfil") %>' Style="height: 175px; width: 175px; border-radius: 10px;" align="left" />
                                                <h4 class="card-title" align="center">
                                                    <asp:Label runat="server" Text='<%# Eval("titulo") %>'></asp:Label>
                                                </h4>
                                            </p>
                                            <asp:LinkButton ID="lnkDetalhes" runat="server">   
                                                <div class="text-right">
                                                     <br />
                                                     <br />
                                                     <a href="<%# Eval("id", "DetalhesAnuncio.aspx?id={0}") %>" class="btn btn-primary">Ver detalhes</a> 
                                                </div>                                       
                                            </asp:LinkButton>
                                        </div>
                                    </td> 
                                </tr>
                                </div>
                                  </div> 
                                <br>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        <center>
                        <h3>
                        <asp:Label CssClass="label primary" runat="server" Text="Não há mais prestadores de serviço pendentes" ID="lblPrestadores" Visible="false"></asp:Label>
                            </h3>
                    </center>
                    </p>
                    <br />
                    <br />
                    <br />
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
    </div>
    <script>
        $(document).ready(function () {
            $('#myTable').DataTable();
        });
    </script>
</asp:Content>
