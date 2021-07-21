

<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListagemDeConta.aspx.cs" Inherits="IdealService.ListagemDeConta" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" />
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <title>Listagem de Contas</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="headling pb-5 bg-dark">
            <div class="container py-5">
                <div class="card">
                    <div class="card-body">
                        <div class="col-md-12">
                            <div class="bg-primary text-white shadow-lg p-3 mb-5 bg-white rounded">
                                <h2 class="font-weight-light text-center py-3">
                                    <asp:Label runat="server" ID="lblTitulo" Text="Listagem de Contas"></asp:Label></h2>
                            </div>
                        </div>
                        <p>
                            <asp:Repeater ID="rptContas" runat="server">
                                <HeaderTemplate>
                                    <table class="table table-hover" id="sisDataTable">
                                        <thead>
                                            <tr>
                                                <td style="color: black"><strong>Nome</strong></td>
                                                <td style="color: black"><strong>Email</strong></td>
                                                <td style="color: black"><strong>Funções</strong></td>
                                                <!--#007bff-->
                                            </tr>
                                        </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td style="color: black;">
                                            <%# DataBinder.Eval(Container.DataItem, "nome") %>
                                        </td>
                                        <td style="color: black;">
                                            <%# DataBinder.Eval(Container.DataItem, "email") %>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lnkDetalhes" runat="server">
                                                <a style="color: #007bff;" href='<%# Eval("id", "DetalhesConta.aspx?id={0}") %>'>
                                                <span class="fas fa-eye" title="Detalhes da conta"></span></a>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="lnkRemover" runat="server">
                                                <a style="color: #007bff" href='<%# Eval("id", "RemoverConta.aspx?id={0}") %>'>
                                                <span class="fas fa-trash" style="color: red;" title="Excluir conta"></span></a>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </p>
                    </div>
                    <div class="col-md-12">
                        <asp:Label runat="server" Text="" ID="lblMsg"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('#sisDataTable').dataTable({
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.10.22/i18n/Portuguese-Brasil.json"
            }
        });
    </script>
</asp:Content>
