using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

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

        #endregion
    }
}
