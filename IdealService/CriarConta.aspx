<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CriarConta.aspx.cs" Inherits="IdealService.CriarConta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/textosBgDark.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="bg-dark">
		<article class="card-body mx-auto" style="max-width: 400px;">
			<!-- Crie sua conta -->
			<h2 class="card-title mt-3 text-center texto">Crie sua conta</h2>
			<form>
				<!-- Digitar nome -->
				<div class="form-group">
					<label class="texto" title="Nome completo">Nome completo:</label>
					<asp:RequiredFieldValidator ID="rfvNomeCompleto" ControlToValidate="txtNomeCompleto"
						ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
					
					<asp:TextBox ID="txtNomeCompleto" runat="server" MaxLength="100" 
						CssClass="form-control" placeholder="Digite seu nome completo." title="Digite seu nome completo"></asp:TextBox>
				</div>
				<!-- Digitar Email -->
				<div class="form-group">
					<asp:Label runat="server" ID="lblEmail" CssClass="texto" title="Seu email">Email:</asp:Label>
					<asp:RequiredFieldValidator ID="rfvEmail" ControlToValidate="txtEmail"
						ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
					<asp:TextBox ID="txtEmail" runat="server" MaxLength="100"
						CssClass="form-control" type="email" placeholder="Digite seu email." title="Digite seu email"></asp:TextBox>
				</div>
				<!-- Selecionar DDD e digitar numero -->
				<div class="form-group">
    				<label class="texto" title="Seu numero">Numero:</label>
					<asp:RequiredFieldValidator ID="rfvTelefone" ControlToValidate="txtTelefone"
						ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
					<asp:TextBox ID="txtTelefone" runat="server" MaxLength="15"
						CssClass="form-control" type="number" placeholder="16991234567" title="Digite seu numero"></asp:TextBox>
				</div>
				<!-- Digitar CEP -->
				<div class="form-row">
					<div class="form-group col-md-6">
						<label class="texto" title="Seu CEP">CEP:</label>
	                    <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>
						<asp:RequiredFieldValidator ID="rfvCep" ControlToValidate="txtCep"
							ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
						<asp:TextBox ID="txtCep" runat="server" MaxLength="30"
							CssClass="form-control" placeholder="11111333" title="Digite seu CEP"></asp:TextBox>
					</div>
					<div class="form-group col-md-6">
						<label class="texto" title="Resultado CEP">Cidade:</label>
						<asp:TextBox ID="txtCidade" runat="server" MaxLength="30"
						CssClass="form-control" placeholder="Cidade - Estado" title="Sua cidade" Enabled="false"></asp:TextBox>
					</div>
				</div>
				<!-- Digitar senha -->
				<div class="form-group">
					<label class="texto" title="Digite sua senha">Senha:</label>
    				<asp:RequiredFieldValidator ID="rfvPassword" ControlToValidate="txtSenha"
						ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
					<asp:TextBox ID="txtSenha" runat="server" MaxLength="50" TextMode="Password"
						CssClass="form-control" placeholder="Digite sua senha:" title="Digite sua senha"></asp:TextBox>
				</div>
				<!-- Botão Criar conta -->
				<div class="form-group">
					<asp:Button ID="btnValidar" CssClass="btn btn-primary btn-block" runat="server" Text="Validar" title="Validar" OnClick="btnValidar_Click"/>
				</div>
				<!-- Botão Criar conta -->
				<div class="form-group">
					<asp:Button ID="btnCriar" CssClass="btn btn-primary btn-block" runat="server" Text="Criar conta" title="Criar sua conta" OnClick="btnCriar_Click"/>
				</div>
				<!-- Já tem uma conta? Logar -->
				<p class="text-center texto">Já tem uma conta? <a href="Login.aspx">Logar</a> </p> 
			</form>
		</article>
	</div>
</asp:Content>