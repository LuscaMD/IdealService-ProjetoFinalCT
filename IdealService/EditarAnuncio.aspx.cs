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
    public partial class EditarAnuncio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!Page.IsPostBack)
            {
                if (CapturarID())
                {
                    DadosConsulta();
                    lblFinal.Text = "";

                }
            }

            btnAtualizar.Enabled = false;
            FUFoto.Enabled = false;
            FUPerfilEnviar.Enabled = false;
            FUPerfil.Enabled = false;
            lblFinal.Text = "";
        }

        private void DadosConsulta()
        {
            var idAnuncio = ObterIdAnuncio();

            try
            {
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = Conexao.Connection;
                cmd.CommandText = @"select * from anuncio where id = @id";
                cmd.Parameters.AddWithValue("id", idAnuncio);


                Conexao.Conectar();
                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    txtTitulo.Text = reader["titulo"].ToString();
                    txtServico.Text = reader["servico"].ToString();
                    txtTelefone.Text = reader["telefone"].ToString();
                    txtDescricao.Text = reader["descricao"].ToString();
                    txtCep.Text = reader["cep"].ToString();
                    lblStatus.Text = reader["status"].ToString();
                    FUPerfil.ImageUrl = reader["imgPerfil"].ToString();
                    FUFoto1.ImageUrl = reader["img1"].ToString();
                    FUFoto2.ImageUrl = reader["img2"].ToString();
                    FUFoto3.ImageUrl = reader["img3"].ToString();
                }
                using (var ws = new BuscarCep.AtendeClienteClient())
                {
                    var resultado = ws.consultaCEP(txtCep.Text);

                    txtCidade.Text = resultado.cidade;
                    txtEstado.Text = resultado.uf;
                }
                if(lblStatus.Text == "Aprovado")
                {
                    lblStatus.CssClass = "text text-success";
                }
                if(lblStatus.Text == "Pendente")
                {
                    lblStatus.CssClass = "text text-warning";
                }
                if (lblStatus.Text == "Reprovado")
                {
                    lblStatus.CssClass = "text text-danger";
                }

                if (FUFoto1.ImageUrl == "")
                {
                    FUFoto1.Visible = false;
                }
                if (FUFoto2.ImageUrl == "")
                {
                    FUFoto2.Visible = false;
                }
                if (FUFoto3.ImageUrl == "")
                {
                    FUFoto3.Visible = false;
                }
                if (FUFoto1.ImageUrl == "" && FUFoto2.ImageUrl == "" && FUFoto3.ImageUrl == "")
                {
                    lblImgAnuncios.Visible = false;
                }


            }
            catch (Exception ex)
            {
                lblFinal.CssClass = "alert alert-danger";
                lblFinal.Text = "Ocorreu um erro: " + ex.Message;
            }
            finally
            {

                Conexao.Desconectar();

            }
        }

        private object ObterIdAnuncio()
        {
            var id = 0;
            var idUrl = Request.QueryString["id"];
            if (!int.TryParse(idUrl, out id))
            {
                throw new Exception("ID inválido");
            }
            if (id <= 0)
            {
                throw new Exception("ID inválido");
            }

            return id;
        }

        private bool CapturarID()
        {
            return Request.QueryString.AllKeys.Contains("id");
        }



        protected void btnExcluir_Click(object sender, EventArgs e)
        {

            var Resultado = MessageBox.Show(@"Você tem certeza?", "Excluir Anuncio", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (Resultado == DialogResult.Yes)
            {
                var idAnuncio = ObterIdAnuncio();

                MySqlCommand cmd = new MySqlCommand();

                try
                {
                    cmd.Connection = Conexao.Connection;
                    cmd.CommandText = @"delete from anuncio
                                    where id = @id";
                    cmd.Parameters.AddWithValue("id", idAnuncio);

                    Conexao.Conectar();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(@"Tente novamente", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                finally
                {
                    Conexao.Desconectar();
                    Response.Redirect("MeusAnuncios.aspx");
                }
            }
            else
            {
                Response.Redirect("MeusAnuncios.aspx");
            }

        }

        protected void btnAtualizar_Click(object sender, EventArgs e)
        {
            String nome2 = "";
            String caminho2 = Server.MapPath(@"\");
            MySqlCommand cmd = new MySqlCommand();

            try
            {
                if (FUPerfilEnviar.HasFile)
                {
                    Guid foto = Guid.NewGuid();
                    nome2 = @"Foto\" + foto + FUPerfilEnviar.PostedFile.FileName;
                    FUPerfilEnviar.PostedFile.SaveAs(caminho2 + nome2);
                }
                else
                {
                    Guid foto = Guid.NewGuid();

                    nome2 = FUPerfil.ImageUrl;




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
                    else
                    {
                        nomeIMG1 = FUFoto1.ImageUrl;
                        nomeIMG2 = FUFoto2.ImageUrl;
                        nomeIMG3 = FUFoto3.ImageUrl;
                    }

                }

                cmd.Connection = Conexao.Connection;
                cmd.CommandText = @"update anuncio
                                    set titulo = @titulo,
                                    servico = @servico,
                                    telefone = @telefone,
                                    descricao = @descricao,
                                    cep = @cep,
                                    imgPerfil = @imgPerfil,
                                    img1 = @img1,
                                    img2 = @img2,
                                    img3 = @img3,
                                    status = @status
                                    where id = @id";

                cmd.Parameters.AddWithValue("@id", ObterIdAnuncio().ToString());
                cmd.Parameters.AddWithValue("titulo", txtTitulo.Text);
                cmd.Parameters.AddWithValue("servico", txtServico.Text);
                cmd.Parameters.AddWithValue("telefone", txtTelefone.Text);
                cmd.Parameters.AddWithValue("descricao", txtDescricao.Text);
                cmd.Parameters.AddWithValue("cep", txtCep.Text);
                cmd.Parameters.AddWithValue("status", "Pendente");
                cmd.Parameters.AddWithValue("imgPerfil", nome2);
                cmd.Parameters.AddWithValue("img1", nomeIMG1);
                cmd.Parameters.AddWithValue("img2", nomeIMG2);
                cmd.Parameters.AddWithValue("img3", nomeIMG3);


                using (var ws = new BuscarCep.AtendeClienteClient())
                {
                    var resultado = ws.consultaCEP(txtCep.Text);

                    txtCidade.Text = resultado.cidade;
                    txtEstado.Text = resultado.uf;
                }

                Conexao.Conectar();
                cmd.ExecuteNonQuery();
            }
            catch
            {

            }
            finally
            {
                Conexao.Desconectar();
                Response.Redirect("DigiteOCEP.aspx");
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("DigiteOCEP.aspx");
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
                    btnAtualizar.Enabled = true;
                    FUFoto.Enabled = true;
                    FUPerfilEnviar.Enabled = true;
                    lblFinal.Text = "";
                }

                btnValidarCEP.Visible = false;
                MessageBox.Show(@"Clique em salvar alterações", "Sem erros", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtCep.Enabled = false;
                txtDescricao.Enabled = false;
                txtEstado.Enabled = false;
                txtTitulo.Enabled = false;
                txtServico.Enabled = false;
                txtTelefone.Enabled = false;

            }
            catch
            {
                MessageBox.Show(@"Revise seus dados", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }

        }
    }
}