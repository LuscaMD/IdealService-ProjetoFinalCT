<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="RedefinirSenha.aspx.cs" Inherits="IdealService.RedefinirSenha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link href="Css/textosBgDark.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-dark">
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<article class="card-body mx-auto" style="max-width: 400px;">
			<!-- Crie sua conta -->
			<h2 class="card-title mt-3 text-center texto">Redefina sua senha</h2>
			<asp:Label ID="lblMsg" style="color:red;" runat="server" CssClass="text text-info label"></asp:Label>
			<form>
				<!-- Digitar Senha -->
				<div class="form-group">
					<asp:Label runat="server" ID="lblNovaSenha" CssClass="texto" title="Senha">Senha nova:</asp:Label>
					<asp:RequiredFieldValidator ID="rfvNovaSenha" ControlToValidate="txtNovaSenha"
						ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
					<asp:TextBox ID="txtNovaSenha" runat="server" MaxLength="100"
						CssClass="form-control" type="password" placeholder="Digite a nova senha." title="Digite sua nova senha"></asp:TextBox>
				</div>
				<!-- Repetir senha -->
				<div class="form-group">
					<asp:Label runat="server" ID="lblRepetirSenha" CssClass="texto" title="Repita sua senha">Repita a senha:</asp:Label>
					<asp:RequiredFieldValidator ID="rfvRepetirSenha" ControlToValidate="txtRepetirSenha"
						ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
					<asp:TextBox ID="txtRepetirSenha" runat="server" MaxLength="100"
						CssClass="form-control" type="password" placeholder="Repita a nova senha." title="Repita a nova senha."></asp:TextBox>
				</div>
				<!-- Botão Redefinir Senha -->
				<div class="form-group">
					<asp:Button ID="btnRedefinirSenha" CssClass="btn btn-primary btn-block" runat="server" Text="Redefinir" title="Redefinir senha" OnClick="btnRedefinirSenha_Click"/>
				</div>
			</form>
		</article>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
	</div>
</asp:Content>