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
    public partial class EditarConta : System.Web.UI.Page
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
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = Conexao.Connection;
                cmd.CommandText = @"select * from usuario where id = @id";
                cmd.Parameters.AddWithValue("@id", Session["id"]);

                Conexao.Conectar();
                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    txtTelefone.Text = reader["telefone"].ToString();
                    txtNome.Text = reader["nome"].ToString();
                    txtCep.Text = reader["cep"].ToString();
                    txtEmail.Text = reader["email"].ToString();
                    txtSenha.Text = Session["senha"].ToString();
                }

                if(txtEmail.Text == "idealservicetcc@gmail.com")
                {
                    btnExcluir.Visible = false;
                    txtEmail.Enabled = false;
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

        protected void btnExcluir_Click(object sender, EventArgs e)
        {   
            Response.Redirect("ConfirmarExcluirConta.aspx");
        }

        protected void btnAtualizar_Click(object sender, EventArgs e)
        {

            string query = "SELECT id, nome, email, senha,cep,telefone FROM usuario WHERE email ='" + txtEmail.Text + "' ";
            DataTable dt = new DataTable();

            try
            {
                MySqlDataAdapter da = new MySqlDataAdapter(query, Conexao.Connection);
                data = da.Fill(dt);

            }
            catch (Exception ex)
            {
                lblResultado.Text = "Erro: " + ex.Message;
            }
            if (data == 0 || Session["Email"].ToString() == txtEmail.Text)
            {

                var senhaEncriptada = BCrypt.Net.BCrypt.HashPassword(txtSenha.Text);

                MySqlCommand cmd = new MySqlCommand();

                try
                {
                    cmd.Connection = Conexao.Connection;
                    cmd.CommandText = @"update usuario
                                    set nome = @nome,
                                    cep = @cep,
                                    email = @email,
                                    senha = @senha, 
                                    telefone = @telefone
                                    where id = @id";

                    cmd.Parameters.AddWithValue("id", Session["id"]);
                    cmd.Parameters.AddWithValue("nome", txtNome.Text);
                    cmd.Parameters.AddWithValue("cep", txtCep.Text);
                    cmd.Parameters.AddWithValue("email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("senha", senhaEncriptada);
                    cmd.Parameters.AddWithValue("telefone", txtTelefone.Text);

                    Session["senha"] = txtSenha.Text;
                    Session["Perfil"] = txtNome.Text;

                    using (var ws = new BuscarCep.AtendeClienteClient())
                    {
                        var resultado = ws.consultaCEP(txtCep.Text);

                        txtCidade.Text = resultado.cidade;
                        txtEstado.Text = resultado.uf;
                        cep = 1;
                    }

                    Conexao.Conectar();
                    cmd.ExecuteNonQuery();
                    MessageBox.Show(@"Conta atualizada", "Sem erros", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    
                    if (cep != 0)
                    {
                        lblResultado.CssClass = "text-danger";
                        lblResultado.Text = "Falha: " + ex.Message;
                    }
                    else
                    {
                        lblCEP.CssClass = "text-danger";
                        lblCEP.Text = ex.Message;
                    }
                    MessageBox.Show(@"Revise seus dados", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                finally
                {
                    Conexao.Desconectar();
                    
                }
            }
            else
            {
                MessageBox.Show(@"Esse email já existe", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("PrestadoresDeServico.aspx");
        }
    }
}