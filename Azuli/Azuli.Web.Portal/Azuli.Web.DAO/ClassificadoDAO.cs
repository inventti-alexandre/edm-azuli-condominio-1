using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Azuli.Web.Model;
using System.Data;

namespace Azuli.Web.DAO
{
    public class ClassificadoDAO : AcessoDAO, Interfaces.IClassificado
    {
        public void cadastraClassificado(Model.Classificados oClassificado)
        {
            string clausulaSQL = "SP_CLASSIFICADO";

            try
            {


                SqlCommand comandoSql = new SqlCommand(clausulaSQL);
                comandoSql.Parameters.AddWithValue("@Classificado_Grupo", oClassificado.grpClassificado.grupoClassificado);
                comandoSql.Parameters.AddWithValue("@Classificado_Data", oClassificado.dataClassificado);
                // comandoSql.Parameters.AddWithValue("@Classificado_Grupo", oClassificado.grpClassificado.grupoClassificado);
                comandoSql.Parameters.AddWithValue("@Classificado_Bloco", oClassificado.apartamentoClassificado.bloco);
                comandoSql.Parameters.AddWithValue("@Classificado_AP", oClassificado.apartamentoClassificado.apartamento);
                comandoSql.Parameters.AddWithValue("@Classificado_Descricao", oClassificado.descricaoClassificado);
                comandoSql.Parameters.AddWithValue("@Classificado_Status", oClassificado.statusClassificado);
                comandoSql.Parameters.AddWithValue("@Classificado_Validade", oClassificado.validadeClassificado);
                comandoSql.Parameters.AddWithValue("@Classificado_Img1", oClassificado.classificadoimg1);
                comandoSql.Parameters.AddWithValue("@Classificado_Img2", oClassificado.classificadoimg2);
                comandoSql.Parameters.AddWithValue("@Classificado_Img3", oClassificado.classificadoimg3);
                comandoSql.Parameters.AddWithValue("@Classificado_Img4", oClassificado.classificadoimg4);
                comandoSql.Parameters.AddWithValue("@Classificado_email_contato", oClassificado.emailClassificadoContato);
                comandoSql.Parameters.AddWithValue("@Classificado_Tel1", oClassificado.classificadoTelefone1);
                comandoSql.Parameters.AddWithValue("@Classificado_Tel2", oClassificado.classificadoTelefone2);
                comandoSql.Parameters.AddWithValue("@Classificado_Data_Venda", oClassificado.classificadoDataVenda);
                comandoSql.Parameters.AddWithValue("@Classificado_Valor", oClassificado.valorVendaClassificado);

                ExecutaComando(comandoSql);

            }
            catch (Exception e)
            {

                throw e;
            }
        }

        public Model.listClassificados consultaClassificado(Model.Classificados oClassificado)
        {

            string clausulaSql = "SP_LISTA_CLASSIFICADO";
            try
            {
                SqlCommand comandoSql = new SqlCommand(clausulaSql);
                comandoSql.Parameters.AddWithValue("@Classificado_id", oClassificado.idClassificado);
                comandoSql.Parameters.AddWithValue("@Classificado_Grupo", oClassificado.grpClassificado.grupoClassificado);
                comandoSql.Parameters.AddWithValue("@Classificado_Data", oClassificado.dataClassificado);
                comandoSql.Parameters.AddWithValue("@Classificado_Bloco", oClassificado.apartamentoClassificado.bloco);
                comandoSql.Parameters.AddWithValue("@Classificado_AP", oClassificado.apartamentoClassificado.apartamento);
                comandoSql.Parameters.AddWithValue("@Classificado_Descricao", oClassificado.descricaoClassificado);
                comandoSql.Parameters.AddWithValue("@Classificado_Status", oClassificado.statusClassificado);
                //comandoSql.Parameters.AddWithValue("@Classificado_Img1", oClassificado.classificadoimg1);
                //comandoSql.Parameters.AddWithValue("@Classificado_Img2", oClassificado.classificadoimg2);
                //comandoSql.Parameters.AddWithValue("@Classificado_Img3", oClassificado.classificadoimg3);
                //comandoSql.Parameters.AddWithValue("@Classificado_Img4", oClassificado.classificadoimg4);
                //comandoSql.Parameters.AddWithValue("@Classificado_email_contato", oClassificado.emailClassificadoContato);
                //comandoSql.Parameters.AddWithValue("@Classificado_Tel1", oClassificado.classificadoTelefone1);
                //comandoSql.Parameters.AddWithValue("@Classificado_Tel2", oClassificado.classificadoTelefone2);
                //comandoSql.Parameters.AddWithValue("@Classificado_Data_Venda", oClassificado.classificadoDataVenda);
                //comandoSql.Parameters.AddWithValue("@Classificado_Valor", oClassificado.valorVendaClassificado);

                DataTable tbClassificado = new DataTable();

                tbClassificado = ExecutaQuery(comandoSql);

                return populaClassificados(tbClassificado);
            }
            catch (Exception)
            {

                throw;
            }
        }


        private Model.listClassificados populaClassificados(DataTable dt)
        {
            Model.listClassificados olistClassificado = new listClassificados();


            foreach (DataRow itemOcorrencia in dt.Rows)
            {
                Classificados oClassificado = new Classificados();
                GrupoClassificados oGrpClassificados = new GrupoClassificados();
                ApartamentoModel oApClassifica = new ApartamentoModel();
                OcorrenciaModel oOcorrencia = new OcorrenciaModel();


                oClassificado.idClassificado = Convert.ToInt32(itemOcorrencia["Classificado_id"]);

                oGrpClassificados.grupoClassificado = Convert.ToInt32(itemOcorrencia["Classificado_Grupo"]);
                oApClassifica.apartamento = Convert.ToInt32(itemOcorrencia["Classificado_AP"]);
                oApClassifica.bloco = Convert.ToInt32(itemOcorrencia["Classificado_Bloco"]);

                oClassificado.grpClassificado = oGrpClassificados;
                oClassificado.apartamentoClassificado = oApClassifica;

                oClassificado.descricaoClassificado = itemOcorrencia["Classificado_Descricao"].ToString();
                oClassificado.statusClassificado = itemOcorrencia["Classificado_Status"].ToString();
                oClassificado.validadeClassificado = Convert.ToDateTime(itemOcorrencia["Classificado_Validade"]);
                oClassificado.classificadoimg1 = itemOcorrencia["Classificado_Img1"].ToString();
                oClassificado.classificadoimg2 = itemOcorrencia["Classificado_Img2"].ToString();
                oClassificado.classificadoimg3 = itemOcorrencia["Classificado_Img3"].ToString();
                oClassificado.classificadoimg4 = itemOcorrencia["Classificado_Img4"].ToString();
                oClassificado.emailClassificadoContato = itemOcorrencia["Classificado_email_contato"].ToString();
                oClassificado.classificadoTelefone1 = itemOcorrencia["Classificado_Tel1"].ToString();
                oClassificado.classificadoTelefone2 = itemOcorrencia["Classificado_Tel2"].ToString();
                oClassificado.classificadoDataVenda = Convert.ToDateTime(itemOcorrencia["Classificado_Validade"]);
                oClassificado.valorVendaClassificado = Convert.ToDouble(itemOcorrencia["Classificado_Valor"]);
                oClassificado.dataClassificado = Convert.ToDateTime(itemOcorrencia["Classificado_Data"]);

                olistClassificado.Add(oClassificado);


            }

            return olistClassificado;
        }


    }
}
