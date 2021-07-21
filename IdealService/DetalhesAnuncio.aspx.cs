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
    public partial class DetalhesAnuncio : System.Web.UI.Page
    {
        int data;
        int idMiA;
        int idMaA;
        protected void Page_Load(object sender, EventArgs e)
        {
            idMiA = (int)Session["IDminA"];
            idMaA = (int)Session["IDmaxA"];

            btnProximo.Visible = false;
            btnVoltar.Visible = false;

            btnComentar.Visible = false;
            if (CapturaID())
            {
                DadosConsulta();
            }
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            btnWpp.Visible = false;

            //Prestador de Serviço
            if ((int)Session["id"] != 1 || (int)Session["Analisar"] == 0)
            {
                btnExcluir.Visible = false;
                btnWpp.Visible = true;
                btnReprovar.Visible = false;
                btnAprovar.Visible = false;
            }

            //ADM após Prestador
            if ((int)Session["id"] == 1 && (int)Session["Analisar"] == 0)
            {
                btnExcluir.Visible = true;
                btnReprovar.Visible = false;
                btnAprovar.Visible = false;
            }

            //Prestador Pendente
            if ((int)Session["id"] == 1 && (int)Session["Analisar"] == 1)
            {
                btnExcluir.Visible = false;
                btnComentarios.Visible = false;
                lblComentario.Visible = false;
                divcomentario.Visible = false;
                btnWpp.Visible = false;
                divwpp.Visible = false;

            }
            if (idMiA == 1 && idMaA == 20)
            {
                btnVoltar.Enabled = false;
            }
            CarregarComentarios();
            rptComentarios.Visible = false;
            txtComentario.Visible = false;
        }

        private bool CapturaID()
        {
            return Request.QueryString.AllKeys.Contains("id");
        }

        private void CarregarComentarios()
        {

            string query = @"SELECT id, comentario, idAnuncio, nome FROM comentarios WHERE id >= '" + idMiA + "' AND id <= '" + idMaA + "' AND idAnuncio = '" + Session["idAnuncio"] + "' ORDER BY id Desc";
            DataTable dt = new DataTable();

            try
            {
                MySqlDataAdapter da = new MySqlDataAdapter(query, Conexao.Connection);

                data = da.Fill(dt);


                rptComentarios.DataSource = dt;
                rptComentarios.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        private void DadosConsulta()
        {
            try
            {
                int IdAnuncio = ObterIdAnuncio();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = Conexao.Connection;
                cmd.CommandText = @"select * from anuncio where id = @id";

                cmd.Parameters.AddWithValue("id", IdAnuncio);

                Conexao.Conectar();
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Session["idAnuncio"] = reader["id"].ToString();
                    txtTitulo.Text = reader["titulo"].ToString();
                    txtServico.Text = reader["servico"].ToString();
                    txtTelefone.Text = reader["telefone"].ToString();
                    txtDescricao.Text = reader["descricao"].ToString();
                    txtCep.Text = reader["cep"].ToString();
                    FUPerfil.ImageUrl = reader["imgPerfil"].ToString();
                    FUFoto1.ImageUrl = reader["img1"].ToString();
                    FUFoto2.ImageUrl = reader["img2"].ToString();
                    FUFoto3.ImageUrl = reader["img3"].ToString();
                }
                using (var ws = new BuscarCep.AtendeClienteClient())
                {
                    var resultado = ws.consultaCEP(txtCep.Text);
                    txtCidade.Text = resultado.cidade + " - " + resultado.uf;
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
                lblResultado.ForeColor = System.Drawing.Color.Red;
                lblResultado.Text = $"Falha: {ex.Message}";
            }
            finally
            {
                Conexao.Desconectar();
            }
        }

        private int ObterIdAnuncio()
        {
            var id = 0;
            var idUrl = Request.QueryString["id"];
            if (!int.TryParse(idUrl, out id))
            {
                throw new Exception("Código inválido");
            }
            if (id <= 0)
            {
                throw new Exception("Código inválido");
            }

            return id;
        }


        protected void btnWpp_Click(object sender, EventArgs e)
        {
            Response.Write("<script language='javascript'>window.open('https://web.whatsapp.com/send?phone=" + "55" + txtTelefone.Text + "&text=" + txtMensagem.Text + "', '_newtab');</script>");
        }

        protected void btnReprovar_Click(object sender, EventArgs e)
        {
            var Resultado = MessageBox.Show(@"Você tem certeza?", "Reprovar anuncio", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (Resultado == DialogResult.Yes)
            {
                try
                {
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = Conexao.Connection;
                    cmd.CommandText = @"update anuncio
                                    set status = @status
                                    where id = @id";

                    cmd.Parameters.AddWithValue("@id", ObterIdAnuncio().ToString());
                    cmd.Parameters.AddWithValue("status", "Reprovado");
                    Conexao.Conectar();
                    cmd.ExecuteNonQuery();
                }
                catch
                {

                }
                finally
                {
                    Conexao.Desconectar();
                    Response.Redirect("PADM.aspx");
                }
            }
            else
            {
                Response.Redirect("PrestadoresDeServico.aspx");
            }
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

        protected void btnAprovar_Click(object sender, EventArgs e)
        {
            var Resultado = MessageBox.Show(@"Você tem certeza?", "Aprovar Anuncio", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (Resultado == DialogResult.Yes)
            {
                try
                {
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = Conexao.Connection;
                    cmd.CommandText = @"update anuncio
                                    set status = @status
                                    where id = @id";

                    cmd.Parameters.AddWithValue("@id", ObterIdAnuncio().ToString());
                    cmd.Parameters.AddWithValue("status", "Aprovado");

                    Conexao.Conectar();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {

                }
                finally
                {
                    Conexao.Desconectar();
                    Response.Redirect("PADM.aspx");
                }
            }
            else
            {
                Response.Redirect("PADM.aspx");
            }
        }

        protected void btnComentarios_Click(object sender, EventArgs e)
        {
            rptComentarios.Visible = true;
            btnComentarios.Visible = false;
            txtComentario.Visible = true;
            btnComentar.Visible = true;
            btnProximo.Visible = true;
            btnVoltar.Visible = true;

        }

        protected void btnComentar_Click(object sender, EventArgs e)
        {
            if (txtComentario != null)
            {
                var Resultado = MessageBox.Show(@"Você tem certeza?", "Comentar", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                if (Resultado == DialogResult.Yes)
                {
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = Conexao.Connection;
                    cmd.CommandText = @"insert into comentarios
                                    (comentario,idAnuncio,nome)
                                    values
                                   (@comentario,@idAnuncio,@nome)";

                    cmd.Parameters.AddWithValue("comentario", txtComentario.Text);
                    cmd.Parameters.AddWithValue("idAnuncio", Session["idAnuncio"]);
                    cmd.Parameters.AddWithValue("nome", Session["Perfil"]);

                    Conexao.Conectar();

                    cmd.ExecuteNonQuery();

                    MessageBox.Show(@"Comentário publicado", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);


                    rptComentarios.Visible = true;
                    btnComentarios.Visible = false;
                    txtComentario.Visible = true;
                    btnComentar.Visible = true;
                    btnProximo.Visible = true;
                    btnVoltar.Visible = true;

                    var teste = Session["idAnuncio"];

                    Response.Redirect($"DetalhesAnuncio.aspx?id={teste}");
                }
                else
                {
                    var teste = Session["idAnuncio"];
                    Response.Redirect($"DetalhesAnuncio.aspx?id={teste}");
                }
            }
            else
            {
                MessageBox.Show(@"Digite alguma coisa", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            idMiA = idMiA - 20;
            idMaA = idMaA - 20;
            Session["IDminA"] = idMiA;
            Session["IDmaxA"] = idMaA;
            CarregarComentarios();
            if (idMiA == 1)
            {
                btnVoltar.Enabled = false;
            }
            rptComentarios.Visible = true;
            btnComentarios.Visible = false;
            txtComentario.Visible = true;
            btnComentar.Visible = true;
            btnProximo.Visible = true;
            btnVoltar.Visible = true;
            btnProximo.Enabled = true; ;
        }

        protected void btnProximo_Click(object sender, EventArgs e)
        {
            idMiA = idMiA + 20;
            idMaA = idMaA + 20;
            Session["IDminA"] = idMiA;
            Session["IDmaxA"] = idMaA;
            CarregarComentarios();
            btnVoltar.Enabled = true;
            rptComentarios.Visible = true;
            btnComentarios.Visible = false;
            txtComentario.Visible = true;
            btnComentar.Visible = true;
            btnProximo.Visible = true;
            btnVoltar.Visible = true;
            if (data == 0)
            {
                btnProximo.Enabled = false;
            }
        }

        protected void btnVoltar_Click1(object sender, EventArgs e)
        {
            Response.Redirect(Session["Voltar"].ToString(), false);
        }
    }
}