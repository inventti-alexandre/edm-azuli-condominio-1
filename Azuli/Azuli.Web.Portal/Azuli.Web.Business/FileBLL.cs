using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Azuli.Web.DAO;

namespace Azuli.Web.Business
{
    public class FileBLL:Interfaces.IFile
    {
        #region IFile Members

        public void publicarArquivo(Model.File oFile)
        {
            FileDAO oFileDAO = new FileDAO();
            try
            {
                
                oFileDAO.publicarArquivo(oFile);

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
