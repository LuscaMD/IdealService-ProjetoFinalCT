<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FaqMinhaConta.aspx.cs" Inherits="IdealService.FaqMinhaConta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <link href="../Css/FaqSuporte.css" rel="stylesheet" />
    <title>FAQ: Minha Conta</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <h1 style="text-align: center; color: white;">FAQ: Minha Conta</h1>
        <div class="accordion" id="accordionExample">
            <div class="card">
                <div class="card-header" id="perguntaUm">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#RespostaUm" aria-expanded="true" aria-controls="collapseOne">
                            Os administradores tem acesso a minha senha?
                        </button>
                    </h2>
                </div>
                <div id="RespostaUm" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body">
                        Não, nós utilizamos técnologia BCrypt para criptografar as senhas dos usuários cadastrados.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="perguntaDois">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#RespostaDois" aria-expanded="false" aria-controls="collapseTwo">
                            Onde posso ir para mudar os dados da minha conta?
                        </button>
                    </h2>
                </div>
                <div id="RespostaDois" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                    <div class="card-body">
                        Você pode mudar seus dados na página de perfil ou clicando <a href="../EditarConta.aspx">aqui</a> para ser redirecionado.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="perguntaTres">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#RespostaTres" aria-expanded="false" aria-controls="collapseTwo">
                            Posso ter duas contas com um mesmo email?
                        </button>
                    </h2>
                </div>
                <div id="RespostaTres" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                    <div class="card-body">
                        Não, é permitido somente uma conta por email.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="perguntaQuatro">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#RespostaQuatro" aria-expanded="false" aria-controls="collapseThree">
                            Esqueci minha senha, o que devo fazer?
                        </button>
                    </h2>
                </div>
                <div id="RespostaQuatro" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                    <div class="card-body">
                        Caso você esqueça sua senha, você pode entrar na página "<a href="../EsqueciSenha.aspx">Esqueci minha senha</a>" para trocar sua senha.
                    <br />
                        OBS: Para conseguir trocar a senha é necessário colocar o email e numero de telefone que foram utilizados no cadastrado.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="perguntaCinco">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#RespostaCinco" aria-expanded="false" aria-controls="collapseFour">
                            O que acontece se eu tentar mudar meu email para um email já cadastrado?
                        </button>
                    </h2>
                </div>
                <div id="RespostaCinco" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                    <div class="card-body">
                        Um aviso mostrará que o email já está em uso será caso você tente trocar para um email com uma conta existente.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="perguntaSeis">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#RespostaSeis" aria-expanded="false" aria-controls="collapseFive">
                            Se minha conta for banida, posso criar outra conta com o mesmo email?
                        </button>
                    </h2>
                </div>
                <div id="RespostaSeis" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                    <div class="card-body">
                        Não, se sua conta for banida você não poderá criar outra conta com o mesmo email.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="perguntaSete">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#RespostaSete" aria-expanded="false" aria-controls="collapseFive">
                            Por qual motivo eu preciso ter uma conta para acessar certas partes do site?
                        </button>
                    </h2>
                </div>
                <div id="RespostaSete" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                    <div class="card-body">
                        Por motivos de segurança e também de controle de acesso em nosso site, optamos por deixar partes mais específicas como os detalhes dos anuncios, visivel somente para pessoas com contas criadas e verificadas.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="headingOito">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#RespostaOito" aria-expanded="false" aria-controls="collapseFive">
                            Como eu posso mudar o email da minha conta?
                        </button>
                    </h2>
                </div>
                <div id="RespostaOito" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                    <div class="card-body">
                        Você pode mudar seu email indo na página de perfil ou clicando <a href="../EditarConta.aspx">aqui</a> para ser redirecionado.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="perguntaNove">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#RespostaNove" aria-expanded="false" aria-controls="collapseFive">
                            Onde eu posso ir para mudar a minha senha?
                        </button>
                    </h2>
                </div>
                <div id="RespostaNove" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                    <div class="card-body">
                        Você pode mudar sua senha na página de perfil ou clicando <a href="../EditarConta.aspx">aqui</a> para ser redirecionado.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="perguntaDez">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#RespostaDez" aria-expanded="false" aria-controls="collapseFive">
                            Como eu posso excluir a minha conta?
                        </button>
                    </h2>
                </div>
                <div id="RespostaDez" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                    <div class="card-body">
                        Você pode excluir sua conta na página de perfil ou clicando <a href="../EditarConta.aspx">aqui</a> para ser redirecionado.
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
