using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IdealService
{
    public partial class SelecionarPrestador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["IDmin"] = 1;
            Session["IDmax"] = 20;
            Session["Procurar"] = 0;
            Session["Analisar"] = 0;
        }

        protected void btnDiarista_Click(object sender, EventArgs e)
        {
            Session["Escolha"] = "Diarista";
            Response.Redirect("PrestadoresDeServico.aspx", false);
        }
        protected void btnPedreiro_Click(object sender, EventArgs e)
        {
            Session["Escolha"] = "Pedreiro";
            Response.Redirect("PrestadoresDeServico.aspx", false);
        }
        protected void btnEletricista_Click(object sender, EventArgs e)
        {
            Session["Escolha"] = "Eletricista";
            Response.Redirect("PrestadoresDeServico.aspx", false);
        }
        protected void btnMarceneiro_Click(object sender, EventArgs e)
        {

            Session["Escolha"] = "Marceneiro";
            Response.Redirect("PrestadoresDeServico.aspx", false);
        }
        protected void btnCalheiro_Click(object sender, EventArgs e)
        {
            Session["Escolha"] = "Calheiro";
            Response.Redirect("PrestadoresDeServico.aspx", false);
        }
        protected void btnPintor_Click(object sender, EventArgs e)
        {
            Session["Escolha"] = "Pintor";
            Response.Redirect("PrestadoresDeServico.aspx", false);
        }
        protected void btnEncanador_Click(object sender, EventArgs e)
        {
            Session["Escolha"] = "Encanador";
            Response.Redirect("PrestadoresDeServico.aspx", false);
        }
        protected void btnVidraceiro_Click(object sender, EventArgs e)
        {
            Session["Escolha"] = "Vidraceiro";
            Response.Redirect("PrestadoresDeServico.aspx", false);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }
    }
}