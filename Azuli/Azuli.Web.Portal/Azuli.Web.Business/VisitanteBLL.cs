using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Azuli.Web.DAO;
using Azuli.Web.Model;

namespace Azuli.Web.Business
{
    public class VisitanteBLL
    {
        VisitanteDAO oVisitanteDAO = new VisitanteDAO();

        public void cadastraVisitante(Model.Visitante oVisitante)
        {
            try
            {
                oVisitanteDAO.cadastraVisitante(oVisitante);                
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void procuraVisitanteRG(Model.Visitante oVisitante)
        {
            try
            {
                oVisitanteDAO.procuraVisitanteRG(oVisitante);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void procuraVisitanteNome(Model.Visitante oVisitante)
        {
            try
            {
                oVisitanteDAO.procuraVisitanteNome(oVisitante);
            }
            catch (Exception)
            {

                throw;
            }
        }

    }
}
