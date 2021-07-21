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
    public partial class CentralDaAjuda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviarDuvida_Click(object sender, EventArgs e)
        {
            try
            {
                using (SmtpClient client = new SmtpClient("smtp.gmail.com", 587))
                {
                    using (MailMessage email = new System.Net.Mail.MailMessage())
                    {
                        //Servidor SMTP
                        client.DeliveryMethod = SmtpDeliveryMethod.Network;
                        client.UseDefaultCredentials = true;
                        //                                                  Retiramos o token que ficava aqui por motivos de segurança
                        client.Credentials = new System.Net.NetworkCredential("idealservicetcc@gmail.com", "          ");
                        client.Port = 587;
                        client.EnableSsl = true;
                        MailMessage msgObj = new System.Net.Mail.MailMessage();
                        msgObj.To.Add("idealservicetcc@gmail.com");
                        msgObj.From = new MailAddress("idealservicetcc@gmail.com");
                        msgObj.Subject = "Pedido de ajuda: " + txtAssunto.Text;
                        msgObj.Body = @"Dados: "
                                        + "\n\n"
                                        + "Email: " + Session["Email"].ToString()
                                        + "\nAssunto: " + txtAssunto.Text
                                        + "\nDuvida: " + txtMensagem.Text;
                        client.Send(msgObj);
                    }
                }
                MessageBox.Show(@"Um email foi encaminhado para nossa central de ajuda. Fique ligado em seu email.", "Dúvida enviada", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show(@"Erro:" + ex.Message, "Ouve um erro ao enviar sua duvida.", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}