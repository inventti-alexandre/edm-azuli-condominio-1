using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Azuli.Web.Model;

namespace Azuli.Web.DAO
{
    public class FileDAO:AcessoDAO, Interfaces.IFile
    {

        #region IFile Members

        public void publicarArquivo(Model.File oFile)
        {
            string clausulaSQL = "PUBLICAR_ARQUIVO";



            try
            {
                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);
                comandoSQL.Parameters.AddWithValue("@MES", oFile.mes);
                comandoSQL.Parameters.AddWithValue("@ANO", oFile.ano);
                comandoSQL.Parameters.AddWithValue("@NOME_ARQUIVO", oFile.nameFile);
                comandoSQL.Parameters.AddWithValue("@AREA_PUBLICACAO", oFile.areaPublicacao);
                comandoSQL.Parameters.AddWithValue("@ASSUNTO", oFile.assunto);


              

                ExecutaComando(comandoSQL);

               
            }
            catch (Exception)
            {

                throw;
            }
        }

        public Model.ListFile consultaArquivo(Model.File oFile)
        {
            throw new NotImplementedException();
        }



        public int validaCircular(Model.File oFile)
        {
            string clausulaSQL = "VALIDA_PUBLICACAO_CIRCULAR";

            try
            {

                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);
                comandoSQL.Parameters.AddWithValue("@MES", oFile.mes);
                comandoSQL.Parameters.AddWithValue("@ANO", oFile.ano);
       
                DataTable tbFile = new DataTable();

                tbFile = ExecutaQuery(comandoSQL);

                return listaValidacaoPublicacao(tbFile);


            }
            catch (Exception)
            {

                throw;
            }
        }





        public int listaValidacaoPublicacao(DataTable dt)
        {
           int quantidade = 0;

            foreach (DataRow dr in dt.Rows)
            {
              
                quantidade = Convert.ToInt32(dr["PUBLICADO"]);
               
            }

            return quantidade;
        }



        #endregion
    }
}
