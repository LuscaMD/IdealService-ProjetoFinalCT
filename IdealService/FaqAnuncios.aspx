<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FaqAnuncios.aspx.cs" Inherits="IdealService.FaqAnuncios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <link href="Css/FaqSuporte.css" rel="stylesheet" />
    <title>FAQ: Anúncios</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <h1 style="text-align: center; color: white;">FAQ: Anuncios</h1>
        <div class="accordion" id="accordionExample">
            <div class="card">
                <div class="card-header" id="perguntaUm">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#respostaUm" aria-expanded="true" aria-controls="collapseOne">
                            Quantos anuncios eu posso criar?
                        </button>
                    </h2>
                </div>
                <div id="respostaUm" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body">
                        Você pode ter até 5 anuncios ativos simultaneamente.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="perguntaDois">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#respostaDois" aria-expanded="false" aria-controls="collapseFour">
                            Eu preciso pagar algo para publicar um anúncio?
                        </button>
                    </h2>
                </div>
                <div id="respostaDois" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                    <div class="card-body">
                        Não, você não precisa pagar nenhum tipo de taxa para anunciar em nosso site.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="perguntaTres">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#respostaTres" aria-expanded="false" aria-controls="collapseTwo">
                            Eu posso editar os dados do meu anuncio depois de postado?
                        </button>
                    </h2>
                </div>
                <div id="respostaTres" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                    <div class="card-body">
                        Sim, você pode mudar os dados do anuncio e depois mandar para analise novamente.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="perguntaQuatro">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#respostaQuatro" aria-expanded="false" aria-controls="collapseTwo">
                            Como posso excluir um anúncio que eu criei?
                        </button>
                    </h2>
                </div>
                <div id="respostaQuatro" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                    <div class="card-body">
                        Você pode gerenciar seus anuncios na página: <a href="../MeusAnuncios.aspx">Meus Anúncios</a>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="perguntaCinco">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#respostaCinco" aria-expanded="false" aria-controls="collapseThree">
                            Por onde as pessoas irão entrar em contato comigo?
                        </button>
                    </h2>
                </div>
                <div id="respostaCinco" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                    <div class="card-body">
                        As pessoas entrarão em contato com você via WhatsApp, portanto coloque um número válido na hora de criar o anuncio.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="perguntaSeis">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#respostaSeis" aria-expanded="false" aria-controls="collapseFour">
                            Quantas imagens eu posso ter por anúncio?
                        </button>
                    </h2>
                </div>
                <div id="respostaSeis" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                    <div class="card-body">
                        Você pode ter até 4 imagens por anúncio, sendo 1 delas a imagem de perfil e outras 3 que ficam a sua escolha para demonstrar seu serviço.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="perguntaSete">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#respostaSete" aria-expanded="false" aria-controls="collapseFive">
                            Por que o meu anúncio ainda não está disponível?
                        </button>
                    </h2>
                </div>
                <div id="respostaSete" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                    <div class="card-body">
                        Todos os anúncios depois de criados ou editados, passam por uma verificação afim de garantir que nada ofensivo seja publicado, você pode olhar se seu anúncio está em analise na página <a href="../MeusAnuncios.aspx">Meus Anúncios</a>.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="perguntaOito">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#respostaOito" aria-expanded="false" aria-controls="collapseFive">
                            Como posso denunciar um anúncio?
                        </button>
                    </h2>
                </div>
                <div id="respostaOito" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                    <div class="card-body">
                       Nos envie um email, para que nós tomemos as providências cabíveis.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="perguntaNove">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#respostaNove" aria-expanded="false" aria-controls="collapseFive">
                            Meu tipo de serviço não está listado, o que posso fazer?
                        </button>
                    </h2>
                </div>
                <div id="respostaNove" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                    <div class="card-body">
                        Nos envie um email com o tipo de serviço que gostaria que nós adicionássemos. 
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>