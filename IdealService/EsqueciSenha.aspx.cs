using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace IdealService
{
    public partial class EsqueciSenha : System.Web.UI.Page
    {
        string email;
        int codigo;
        string nome;
        protected void Page_Load(object sender, EventArgs e)
        {
            btnTrocar.Enabled = false;
            txtCodigo.Enabled = false;
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            MySqlCommand cmd = new MySqlCommand();
            try
            {
                string email = txtEmail.Text;
                cmd.Connection = Conexao.Connection;
                cmd.CommandText = @"select email, Token, nome from usuario where email = @email ";
                cmd.Parameters.AddWithValue("email", email);
                
                Conexao.Conectar();

                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    codigo =Convert.ToInt32(reader["Token"]);
                    nome = reader["nome"].ToString();
                }



                if (string.IsNullOrEmpty(email))
                {
                    MessageBox.Show(@"Nenhum email foi encontrado", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    Response.Redirect("EsqueciSenha.aspx");
                    //throw new Exception("Usuário ou senha ínválidos");
                }


            }
            catch (Exception ex)
            {
                lblMsg.CssClass = "text-danger";
                lblMsg.Text = ex.Message;
            }
            finally
            {
                Session["EmailTemporario"] = txtEmail.Text;
                Verificação();
                Conexao.Desconectar();
            }
            btnTrocar.Enabled = true;
            txtCodigo.Enabled = true;
            btnEnviar.Enabled = false;
            txtEmail.Enabled = false;
            if(codigo == 0)
            {  
                codigo = (int)Session["codigo"];
            }
            else {
                Session["codigo"] = codigo;
            }
            
            
        }

        protected void btnTrocar_Click(object sender, EventArgs e)
        {
            if (codigo == 0)
            {
                codigo = (int)Session["codigo"];
            }
            string codigostring = txtCodigo.Text;
            int codigodigitado = Convert.ToInt32(codigostring); 
            if(codigo == codigodigitado)
            {
                Session["EmailTemporario"] = txtEmail.Text;
                Response.Redirect("RedefinirSenha.aspx");
            }
            else
            {
                MessageBox.Show(@"Código Incorreto", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            btnTrocar.Enabled = true;
            txtCodigo.Enabled = true;

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
                        client.Credentials = new System.Net.NetworkCredential("idealservicetcc@gmail.com", "            ");
                        client.Port = 587;
                        client.EnableSsl = true;
                        System.Net.Mail.MailMessage msgObj = new System.Net.Mail.MailMessage();
                        msgObj.To.Add(txtEmail.Text);
                        msgObj.From = new MailAddress("idealservicetcc@gmail.com");
                        msgObj.Subject = "Redefinindo Senha";
                        msgObj.Body = "Olá, " + nome + "\nEsse é o seu código: " + codigo;

                        client.Send(msgObj);


                    }
                }
                DialogResult dialogResult = MessageBox.Show(@"Enviamos um código no seu email", "Trocar a Senha", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                DialogResult dialogResult = MessageBox.Show(@"Erro:" + ex.Message, "Email Errado", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}