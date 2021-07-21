<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DigiteOCEP.aspx.cs" Inherits="IdealService.DigiteOCEP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />


    <div class="headling pb-5 bg-dark">
        <div class="container">
            <div class="form-row">

                <!-- Descrição -->
                <div class="form-text col-lg-6 col-md-12 col-sm-12 col-12">
                    <label title="Cep" class="text-white">CEP:</label>
                    <asp:RequiredFieldValidator ID="rfvCep" ControlToValidate="txtCep"
                        ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtCep" runat="server" MaxLength="9" CssClass="form-control"
                        placeholder="CEP"></asp:TextBox>
                </div>
                <div class="form-text col-lg-6 col-md-12 col-sm-12 col-12">
                    <label title="Cidade" class="text-white">Cidade:</label>
                    <asp:TextBox ID="txtCidade" runat="server" CssClass="form-control"
                        placeholder="Cidade" Enabled="false"></asp:TextBox>
                </div>
            </div>
            <br>
            <!-- Botão -->
            <div class="form-row">
                <div class="text-center col-md-12">
                    <!-- Cadastrar -->
                    <asp:Button ID="btnValidarCEP" CssClass="btn btn-primary" runat="server" Text="Validar dados" OnClick="btnValidar_Click" />
                    <asp:Button ID="btnProsseguir" CssClass="btn btn-primary" runat="server" Text="Prosseguir" OnClick="btnProsseguir_Click" Enabled="false" />
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

        </div>
    </div>
</asp:Content>
