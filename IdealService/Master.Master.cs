using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IdealService
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                hplAnuncie.Visible = true;
                hplMeusAnuncios.Visible = true;

                if (Session["nivel"].ToString() == "A")
                {
                    hplADM.Visible = true;
                    hplistagemdeconta.Visible = true;
                }

            }
            else
            {
                hplEditarConta.Text = "Login";
                hplEditarConta.NavigateUrl = "Login.aspx";
                hplSair.Text = "Criar conta";
                hplSair.NavigateUrl = "CriarConta.aspx";
            }
            if (Session["Cidade"] != null)
            {
                hplCidade.NavigateUrl = "SelecionarPrestador.aspx";
            }


        }
    }
}