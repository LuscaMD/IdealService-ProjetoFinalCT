using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Windows.Forms;

namespace IdealService
{
    public partial class CriarConta : System.Web.UI.Page
    {
        int data;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtSenha.Enabled = false;
            btnCriar.Enabled = false;
            rfvPassword.Enabled = false;
        }

        protected void btnCriar_Click(object sender, EventArgs e)
        {
            int email;
            string query = "SELECT id, nome, email, senha,cep,telefone FROM usuario WHERE email ='" + txtEmail.Text + "' ";
            DataTable dt = new DataTable();

            try
            {
                MySqlDataAdapter da = new MySqlDataAdapter(query, Conexao.Connection);
                data = da.Fill(dt);
                Conexao.Desconectar();
            }
            catch (Exception ex)
            {
                lblResultado.Text = "Erro: " + ex.Message;
            }
            string query2 = "SELECT id, contasbanidas FROM contasbanidas WHERE contasbanidas ='" + txtEmail.Text + "' ";
            DataTable dt2 = new DataTable();
            
            try
            {
                MySqlDataAdapter da2 = new MySqlDataAdapter(query2, Conexao.Connection);
                email = da2.Fill(dt2);

            }
            finally
            {

            }



            if (email == 0)
            {
                if (data == 0)
                {
                    string nivel;
                    if (txtEmail.Text == "idealservicetcc@gmail.com")
                    {
                        nivel = "A";
                    }
                    else
                    {
                        nivel = "U";
                    }
                    var SenhaEncriptada = BCrypt.Net.BCrypt.HashPassword(txtSenha.Text);
                    Session["Email"] = txtEmail.Text;
                    MySqlCommand cmd = new MySqlCommand();
                    Verificação();
                    cmd.Connection = Conexao.Connection;
                    cmd.CommandText = @"insert into usuario
                                (nome,email,senha,cep,telefone,nivel,Token)
                                values
                                (@nome,@email,@senha,@cep,@telefone,@nivel,@Token)";
                    cmd.Parameters.AddWithValue("nome", txtNomeCompleto.Text);
                    cmd.Parameters.AddWithValue("email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("senha", SenhaEncriptada);
                    cmd.Parameters.AddWithValue("cep", txtCep.Text);
                    cmd.Parameters.AddWithValue("telefone", txtTelefone.Text);
                    cmd.Parameters.AddWithValue("nivel", nivel);
                    cmd.Parameters.AddWithValue("Token", Session["Token"]);


                    Conexao.Conectar();

                    cmd.ExecuteNonQuery();

                    txtNomeCompleto.Text = "";
                    txtEmail.Text = "";
                    txtSenha.Text = "";
                    txtCep.Text = "";
                    txtTelefone.Text = "";
                    txtCidade.Text = "";
                    Response.Redirect("VerificacaoDaConta.aspx", false);
                }
                else
                {
                    lblEmail.CssClass = "text-danger";
                    lblEmail.Text = "Já existe uma conta com esse email.";
                }
                }
            else
            {
                MessageBox.Show("Esse email foi banido", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
                Response.Redirect("CriarConta.aspx");
            }

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
                if (txtCidade.Text != "")
                {
                    btnCriar.Enabled = true;
                    rfvPassword.Enabled = true;
                    txtSenha.Enabled = true;

                }
                btnValidar.Enabled = false;
            }
            catch
            {
                lblResultado.CssClass = "text-danger";
                lblResultado.Text = "Inválido";
            }
            finally
            {
                if (btnCriar.Enabled == true)
                {
                    lblResultado.CssClass = "text-success";
                    lblResultado.Text = "Válido";
                }
            }
        }
        private void Verificação()
        {
            try
            {
                using (SmtpClient client = new SmtpClient("smtp.gmail.com", 587))
                {
                    using (System.Net.Mail.MailMessage email = new System.Net.Mail.MailMessage())
                    {
                        //Servidor SMTP
                        Random randNum = new Random();
                        int valor = randNum.Next(0, 999999);
                        Session["Token"] = valor;
                        client.DeliveryMethod = SmtpDeliveryMethod.Network;
                        client.UseDefaultCredentials = true;
                        //                                                  Retiramos o token que ficava aqui por motivos de segurança
                        client.Credentials = new System.Net.NetworkCredential("idealservicetcc@gmail.com", "           ");
                        client.Port = 587;
                        client.EnableSsl = true;
                        System.Net.Mail.MailMessage msgObj = new System.Net.Mail.MailMessage();
                        msgObj.To.Add(txtEmail.Text);
                        msgObj.From = new MailAddress("idealservicetcc@gmail.com");
                        msgObj.Subject = "Verificação da Conta no IDEAL SERVICE";
                        msgObj.Body = "Olá, " +txtNomeCompleto.Text +  "\nEsse é o seu código: " + Session["Token"];

                        client.Send(msgObj);


                    }
                }
                DialogResult dialogResult = MessageBox.Show(@"Enviamos um código no seu email", "Verificação do Email", MessageBoxButtons.OK, MessageBoxIcon.Information);  
            }
            catch (Exception ex)
            {
                DialogResult dialogResult = MessageBox.Show(@"Erro:" + ex.Message, "Email Errado", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}