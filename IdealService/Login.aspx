<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IdealService.Login1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" href="IdealService/IdealService.PNG">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="Css/Login1.css" rel="stylesheet" />
    <link href="Css/textosBgDark.css" rel="stylesheet" />
    <!-- <link rel="sortcut icon" href="imagem/favicon.ico" type="image/x-icon"/>   icone que fica em sima do lado do nome do site!-->
    <title>Logar</title>
</head>
<body class="image-responsive container-fluid" style="background-color: #212121;">
    <form id="form1" runat="server">
        <br />
        <br />
        <center>        
            <div class="main2">
                <h1>Bem-vindo ao <span class="type"></span></h1>
            </div>
        </center>

        <div class="main bg-light">
            <div class="text text-center">
                <p class="sign" align="center">Login</p>
                <center>
                        <asp:Label ID="lblMsg" style="color:red;" runat="server" CssClass="text text-info label"></asp:Label>
                    </center>
                <br />
            </div>
            <!-- Email / Senha -->
            <div>
                <asp:TextBox runat="server" ID="txtEmail" type="text" CssClass="form-control logininputs"
                    align="center" placeholder="Email" required="Esse campo deve ser preenchido">
                </asp:TextBox>
                <asp:TextBox runat="server" ID="txtSenha" type="password" CssClass="form-control  logininputs"
                    align="center" placeholder="Senha " required="">
                </asp:TextBox>
            </div>
            <!-- Botão de Login / Esqueceu senha / Cruar-->
            <div>
                <asp:Button runat="server" ID="btnLogin" CssClass="button" Text="Login" type="Submit" OnClick="btnLogin_Click"></asp:Button>
                <p class="forgot" align="center">
                    <a href="EsqueciSenha.aspx" class="texto">Esqueceu a Senha </a>
                    |
                        <a href="CriarConta.aspx" class="texto">Criar Conta</a>
                </p>
            </div>
        </div>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.11"> </script>
    <script>
        var typed = new Typed('.type', {
            strings: ["IdealService"],
            typeSpeed: 125,
            backSpeed: 50,
            loop: true,
        });
    </script>



</body>
</html>
