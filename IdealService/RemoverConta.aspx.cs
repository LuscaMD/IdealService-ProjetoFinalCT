using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace IdealService
{
    public partial class RemoverConta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            var idUsuario = ObterIDUsuarios();


            var Resultado = MessageBox.Show(@"Você tem certeza?", "Banir Conta", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if (Resultado == DialogResult.Yes)
            {
                try
                {
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = Conexao.Connection;
                    cmd.CommandText = @"select email from usuario
                                    where id = @id";
                    cmd.Parameters.AddWithValue("@id", idUsuario);
                    Conexao.Conectar();
                    var reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Session["EmailBanido"] = reader["email"].ToString(); 
                    }
                    Conexao.Desconectar();

                    MySqlCommand cmd2 = new MySqlCommand();
                    cmd2.Connection = Conexao.Connection;
                    cmd2.CommandText = @"insert into contasbanidas
                                (contasbanidas)
                                values
                                (@contasbanidas)";
                    cmd2.Connection = Conexao.Connection;
                    cmd2.Parameters.AddWithValue("contasbanidas", Session["EmailBanido"].ToString());

                    MySqlCommand cmd3 = new MySqlCommand();
                    cmd3.Connection = Conexao.Connection;
                    cmd3.CommandText = @"delete from usuario
                                    where id = @id";

                    cmd3.Parameters.AddWithValue("@id", idUsuario);
                    MySqlCommand cmd4 = new MySqlCommand();
                    cmd4.Connection = Conexao.Connection;
                    cmd4.CommandText = @"delete from anuncio
                                    where idusuario = @idusuario";

                    cmd4.Parameters.AddWithValue("@idusuario", idUsuario);
                    Conexao.Conectar();
                    cmd2.ExecuteNonQuery();
                    cmd3.ExecuteNonQuery();
                    cmd4.ExecuteNonQuery();


                }
                catch (Exception ex)
                {
                    MessageBox.Show(@"Messagem: " + ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                finally
                {
                    Conexao.Desconectar();
                    Response.Redirect("ListagemDeConta.aspx");
                    MessageBox.Show(@"Conta excluída", "Êxito", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
            }
            else
            {
                Response.Redirect("ListagemDeConta.aspx");
            }

        }
        private bool CapturarID()
        {
            return Request.QueryString.AllKeys.Contains("id");
        }
        private object ObterIDUsuarios()
        {
            var id = 0;
            var idURL = Request.QueryString["id"];
            if (!int.TryParse(idURL, out id))
            {
                throw new Exception("ID inválido");
            }
            if (id <= 0)
            {
                throw new Exception("ID inválido");
            }
            return id;
        }


    }
}