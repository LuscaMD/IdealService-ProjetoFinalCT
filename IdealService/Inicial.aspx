<%@ Page Title="" Language="C#" MasterPageFile="~/Nada.Master" AutoEventWireup="true"  Inherits="IdealService.SelecionarPrestador" %>

<script runat="server">

    protected void btnPrestador_Click(object sender, EventArgs e)
    {

    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Nome da Pagina !-->
    <title>Selecionar Prestador</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="Css/Menu.css">

    <!-- <link rel="sortcut icon" href="imagem/favicon.ico" type="image/x-icon"/>;  icone que fica em sima do lado do nome do site!-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" container-fluid  fun ">

        <div class="text-center">
               <center>
            <div class="main2">
                <h1 style="font-size: 45px"> <span class="type"></span></h1>
             </div>
        </center>
            <br>
        </div>
        <br />
        <br />
        <br />
        <br />

        <!-- parte da imagem diarista!-->
        <div class="row">
            <div class="col-sm-6 ">
                <div class="panel panel-default text-center levantar">
                    <div class="panel-body">
                        <div class="container">
                            <img src="Prestadores/procurando.PNG" alt="Avatar" class="image redondo">
                            <div class="middle">
                              <a href="" target="_blank"> <asp:button runat="server" ID="btnPrestador" OnClick="btnPrestador_Click" Text="À Procura de Prestador" class="button"/></a>
                              
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
                            <img src="Prestadores/entrar.jpg" alt="Avatar" class="image redondo">
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

        


    </div>

      <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.11"> </script>
        <script>
            var typed = new Typed('.type', {
                strings: ["Menu Principal"],
                typeSpeed: 125,
                backSpeed: 50,
                loop: true,
            });
        </script>


</asp:Content>
