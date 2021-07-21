using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IdealService
{

    public partial class CriarAnuncio : System.Web.UI.Page
    {
       int bloquear;

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            btnCriar.Enabled = false;
            FUPerfil.Enabled = false;
            FUFoto.Enabled = false;
            CarregarMeusAnuncios();
        }
        protected void btnCriar_Click(object sender, EventArgs e)
        {
            String nome2 = "";
            String caminho2 = Server.MapPath(@"\");
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = Conexao.Connection;
            try
            {
                if (FUPerfil.HasFile)
                {
                    Guid foto = Guid.NewGuid();
                    nome2 = @"Foto\" + foto + FUPerfil.PostedFile.FileName;
                    FUPerfil.PostedFile.SaveAs(caminho2 + nome2);
                }
                else
                {
                    Guid foto = Guid.NewGuid();
                    nome2 = @"Foto\0.png";
                }

                String nome = "";
                String nomeIMG1 = "";
                String nomeIMG2 = "";
                String nomeIMG3 = "";
                String caminho = Server.MapPath(@"Imagens\");

                Guid g = Guid.NewGuid();

                for (int i = 0; i <= 2; i++)
                {
                    if (FUFoto.HasFile || FUFoto.HasFiles)
                    {
                        int teste = FUFoto.PostedFiles.Count;

                        if (i < teste)
                        {
                            nome = g + FUFoto.PostedFiles[i].FileName;
                            FUFoto.PostedFiles[i].SaveAs(caminho + nome);

                            if (i == 0)
                            {

                                nomeIMG1 = @"Imagens\" + nome;


                            }
                            if (i == 1)
                            {

                                nomeIMG2 = @"Imagens\" + nome;
                            }

                            if (i == 2)
                            {

                                nomeIMG3 = @"Imagens\" + nome;

                            }
                        }
                    }

                }



                cmd.CommandText = @"insert into anuncio
                                    (titulo,servico,telefone,descricao,cep,cidade,imgPerfil,img1,img2,img3,idUsuario,status)
                                    values
                                    (@titulo,@servico,@telefone,@descricao,@cep,@cidade,@imgPerfil,@img1,@img2,@img3,@idUsuario,@status)";
                cmd.Parameters.AddWithValue("titulo", txtTitulo.Text);
                cmd.Parameters.AddWithValue("servico", txtServico.Text);
                cmd.Parameters.AddWithValue("telefone", txtTelefone.Text);
                cmd.Parameters.AddWithValue("descricao", txtDescricao.Text);
                cmd.Parameters.AddWithValue("cep", txtCep.Text);
                cmd.Parameters.AddWithValue("imgPerfil", nome2);
                cmd.Parameters.AddWithValue("cidade", txtCidade.Text);
                cmd.Parameters.AddWithValue("img1", nomeIMG1);
                cmd.Parameters.AddWithValue("img2", nomeIMG2);
                cmd.Parameters.AddWithValue("img3", nomeIMG3);
                cmd.Parameters.AddWithValue("idUsuario", Session["id"].ToString());
                cmd.Parameters.AddWithValue("status", "Pendente");




                Conexao.Conectar();

                cmd.ExecuteNonQuery();

                lblResultado.Text = "Inserido com sucesso";
            }

            catch (Exception ex)
            {
                lblResultado.CssClass = "text text-danger";
                lblResultado.Text = "Falha: " + ex.Message;
            }
            finally
            {
                Conexao.Desconectar();

            }
            Response.Redirect("MeusAnuncios.aspx", false);
        }
        
        protected void btnValidar_Click(object sender, EventArgs e)
        {
            try
            {
                if (bloquear < 5)
                {
                    using (var ws = new BuscarCep.AtendeClienteClient())
                    {
                        var resultado = ws.consultaCEP(txtCep.Text);

                        txtCidade.Text = resultado.cidade + " - " + resultado.uf;

                    }
                    if (txtCidade.Text != "")
                    {
                        btnCriar.Enabled = true;
                        FUFoto.Enabled = true;
                        FUPerfil.Enabled = true;
                        lblResultado.Text = "";
                        txtCep.Enabled = false;

                    }
                }
                else
                {
                    lblResultado.CssClass = "text-danger";
                    lblResultado.Text = "Você já tem 5 anúncios criados";
                    
                    if(btnValidarCEP.Text == "Voltar")
                    {
                        Response.Redirect("MeusAnuncios.aspx");
                    }
                    btnValidarCEP.Text = "Voltar";
                }
               
            }
            catch
            {
                lblResultado.CssClass = "text-danger";
                lblResultado.Text = "CEP Errado";
            }
            
        }
        protected void CarregarMeusAnuncios()
        {
            string query = @"SELECT id, titulo, servico, imgPerfil, descricao FROM anuncio WHERE  idUsuario = '" + Session["id"] + "'";


            DataTable dt = new DataTable();

            try
            {
                MySqlDataAdapter da = new MySqlDataAdapter(query, Conexao.Connection);
                bloquear = da.Fill(dt);


            }
            catch (Exception ex)
            {
                lblResultado.Text = "Erro: " + ex.Message;
            }
        }


    }
}