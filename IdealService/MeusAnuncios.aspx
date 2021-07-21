<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MeusAnuncios.aspx.cs" Inherits="IdealService.MeusAnuncios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <title>Meus Anúncios</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="headling pb-5 bg-dark">
        <div class="container py-5">
            <div class="card">
                <div class="card-body">
                    <div class="col-md-12">
                        <div class="bg-primary text-white">
                            <h2 class="font-weight-light text-center py-3">
                                <label>Meus Anúncios</label></h2>
                        </div>
                    </div>
                    <p>
                        <asp:Repeater ID="rptMeusAnuncios" runat="server">
                            <HeaderTemplate>
                                <table class="table table-hover" id="sisDataTable">
                                    <thead>
                                        <tr>
                                        </tr>
                                    </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <!-- class="card col-md-12" = mudar o tamanho do card!-->
                                        <div class="card col-md-12" style="width: 100%">
                                            <div class="card-body">
                                                <p class="card-text" aria-valuetext="12">
                                                    <asp:Image ID="FUPerfil" CssClass="img-fluid" runat="server" src='<%# Eval("imgPerfil") %>' Style="height: 175px; width: 175px;" align="left" />
                                                    <h4 class="card-title" align="center">
                                                        <asp:Label runat="server" Text='<%# Eval("titulo") %>'></asp:Label>
                                                    </h4>
                                                </p>
                                                <asp:LinkButton ID="lnkDetalhes" runat="server">   
                                                    <div class="text-right">
                                                         <br />
                                                         <br />
                                                         <a href="<%# Eval("id", "EditarAnuncio.aspx?id={0}") %>" class="btn btn-primary ">Editar anuncio</a> 
                                                    </div>                                       
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <br>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </p>
                    <br />
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Label runat="server" Text="" ID="lblMsg"></asp:Label>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('#myTable').DataTable();
        });
    </script>
</asp:Content>

