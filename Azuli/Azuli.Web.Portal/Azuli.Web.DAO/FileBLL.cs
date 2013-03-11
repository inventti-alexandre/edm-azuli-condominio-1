using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Azuli.Web.DAO
{
    public class FileBLL:Interfaces.IFile
    {
        #region IFile Members

        public void publicarArquivo(Model.File oFile)
        {
            try
            {
                FileDAO oFileDAO = new FileDAO();
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
