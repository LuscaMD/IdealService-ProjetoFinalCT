<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="SelecionarPrestador.aspx.cs" Inherits="IdealService.SelecionarPrestador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Nome da Pagina !-->
    <title>Selecionar Prestador</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="Css/empregos.css">

    <!-- <link rel="sortcut icon" href="imagem/favicon.ico" type="image/x-icon"/>;  icone que fica em sima do lado do nome do site!-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" container-fluid  fun ">

        <div class="text-center">
            <div class="sombra">
                <h1>Empregos</h1>
            </div>
            <br>
        </div>
        <br />
        <br />

        <!-- parte da imagem diarista!-->
        <div class="row">
            <div class="col-sm-6 ">
                <div class="panel panel-default text-center levantar">
                    <div class="panel-body">
                        <div class="container">
                            <img src="Prestadores/Diarista.png" alt="Avatar" class="image redondo">
                            <div class="middle">
                                <a href="" target="_blank">
                                    <asp:Button runat="server" ID="Button3" Text="Diarista" class="button" OnClick="btnDiarista_Click" /></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />

            <!-- parte da imagem pedreiro!-->
            <div class="col-sm-6  ">
                <div class="panel panel-default text-center levantar">
                    <div class="panel-body">
                        <div class="container">
                            <img src="Prestadores/Pedreiro.png" alt="Avatar" class="image redondo">
                            <div class="middle">
                                <a href="" target="_blank">
                                    <asp:Button runat="server" ID="Button1" Text="Pedreiro" class="button" OnClick="btnPedreiro_Click" /></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />

        <!-- parte da imagem eletricista!-->
        <div class="row">
            <div class="col-sm-6  ">
                <div class="panel panel-default text-center levantar">
                    <div class="panel-body">
                        <div class="container">
                            <img src="Prestadores/Eletricista.png" alt="Avatar" class="image redondo">
                            <div class="middle">
                                <a href="" target="_blank">
                                    <asp:Button runat="server" ID="btnEletricista" Text="Eletricista" class="button" OnClick="btnEletricista_Click" /></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />




            <!-- parte da imagem Marceneiro!-->

            <div class="col-sm-6  ">
                <div class="panel panel-default text-center levantar">
                    <div class="panel-body">
                        <div class="container">
                            <img src="Prestadores/Marceneiro.png" alt="Avatar" class="image redondo">
                            <div class="middle">
                                <a href="" target="_blank">
                                    <asp:Button runat="server" ID="Button2" Text="Marceneiro" class="button" OnClick="btnMarceneiro_Click" /></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <!-- parte da imagem Calheiro!-->
        <div class="row">
            <div class="col-sm-6 ">
                <div class="panel panel-default text-center levantar">
                    <div class="panel-body">
                        <div class="container">
                            <img src="Prestadores/Calheiro.png" alt="Avatar" class="image redondo">
                            <div class="middle">
                                <a href="" target="_blank">
                                    <asp:Button runat="server" ID="btnCalheiro" Text="Calheiro" class="button" OnClick="btnCalheiro_Click" /></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <!-- parte da imagem Pintor!-->
            <div class="col-sm-6 ">
                <div class="panel panel-default text-center levantar">
                    <div class="panel-body">
                        <div class="container">
                            <img src="Prestadores/Pintor.png" alt="Avatar" class="image redondo">
                            <div class="middle">
                                <a href="" target="_blank">
                                    <asp:Button runat="server" ID="btnPintor" Text="Pintor" class="button" OnClick="btnPintor_Click" /></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <!-- parte da imagem Encanador!-->
        <div class="row">
            <div class="col-sm-6  ">
                <div class="panel panel-default text-center levantar">
                    <div class="panel-body">
                        <div class="container">
                            <img src="Prestadores/Encanador.png" alt="Avatar" class="image redondo">
                            <div class="middle">
                                <a href="" target="_blank">
                                    <asp:Button runat="server" ID="btnEncanador" Text="Encanador" class="button" OnClick="btnEncanador_Click" /></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />

            <!-- parte da imagem Vidraceiro!-->
            <div class="col-sm-6  ">
                <div class="panel panel-default text-center levantar">
                    <div class="panel-body">
                        <div class="container">
                            <img src="Prestadores/Vidreiro.png" alt="Avatar" class="image redondo">
                            <div class="middle">
                                <a href="" target="_blank">
                                    <asp:Button runat="server" ID="btnVidraceiro" Text="Vidraceiro" class="button" OnClick="btnVidraceiro_Click" /></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       <br />



    </div>

</asp:Content>
