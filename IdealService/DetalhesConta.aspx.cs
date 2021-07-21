using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace IdealService
{
    public partial class DetalhesConta : System.Web.UI.Page
    {

        int data;
        int cep;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
            }


            if (!Page.IsPostBack)
            {
                DadosConsulta();
                lblResultado.Text = "";
            }
            lblResultado.Text = "";
            lblCEP.Text = "";
        }

        private void DadosConsulta()
        {

           
            try
            {
                int idUsuario = ObterIdUsuario();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = Conexao.Connection;
                cmd.CommandText = @"select * from usuario where id = @id";
                cmd.Parameters.AddWithValue("@id", idUsuario);

                Conexao.Conectar();
                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    txtTelefone.Text = reader["telefone"].ToString();
                    txtNome.Text = reader["nome"].ToString();
                    txtCep.Text = reader["cep"].ToString();
                    txtEmail.Text = reader["email"].ToString();
                }


                using (var ws = new BuscarCep.AtendeClienteClient())
                {
                    var resultado = ws.consultaCEP(txtCep.Text);

                    txtCidade.Text = resultado.cidade;
                    txtEstado.Text = resultado.uf;
                }

            }
            catch (Exception ex)
            {
                lblResultado.CssClass = "text-danger";
                lblResultado.Text = "Ocorreu um erro: " + ex.Message;
            }
            finally
            {
                Conexao.Desconectar();
            }
        }

        private int ObterIdUsuario()
        {
            var id = 0;
            var idUrl = Request.QueryString["id"];
            if (!int.TryParse(idUrl, out id))
            {
                throw new Exception("id inválido");
            }
            if (id <= 0)
            {
                throw new Exception("id inválido");
            }

            return id;
        }
    }
}