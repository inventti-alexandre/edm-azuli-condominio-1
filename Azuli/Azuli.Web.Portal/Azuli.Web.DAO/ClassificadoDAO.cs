using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace Azuli.Web.DAO
{
    public class ClassificadoDAO:AcessoDAO, Interfaces.IClassificado
    {
        public void cadastraClassificado(Model.Classificados oClassificado)
        {
            string clausulaSQL = "SP_CLASSIFICADO";

            try
            {
                SqlCommand comandoSql = new SqlCommand(clausulaSQL);
                comandoSql.Parameters.AddWithValue("@Classificado_Grupo", oClassificado.grpClassificado.grupoClassificado);
                comandoSql.Parameters.AddWithValue("@Classificado_Data", oClassificado.dataClassificado);
                comandoSql.Parameters.AddWithValue("@Classificado_Grupo", oClassificado.grpClassificado.grupoClassificado);
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
            throw new NotImplementedException();
        }
    }
}
