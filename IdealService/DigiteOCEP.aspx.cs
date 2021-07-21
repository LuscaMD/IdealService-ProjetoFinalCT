using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IdealService
{
    public partial class DigiteOCEP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["IDmin"] = 1;
            Session["IDmax"] = 20;
            Session["Procurar"] = 0;

        }
        
        protected void btnValidar_Click(object sender, EventArgs e)
        {
            try
            {
                using (var ws = new BuscarCep.AtendeClienteClient())
                {
                    var resultado = ws.consultaCEP(txtCep.Text);

                    txtCidade.Text = resultado.cidade + " - " + resultado.uf;

                }
                btnProsseguir.Enabled = true;
                
            }
            catch
            {
            }
            
        }

        protected void btnProsseguir_Click(object sender, EventArgs e)
        {

            Response.Redirect("SelecionarPrestador.aspx", false);
            Session["Cidade"] = txtCidade.Text;
        }
    }
}