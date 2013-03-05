using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Azuli.Web.DAO;

namespace Azuli.Web.Business
{
    public class LancamentoOcorrencia:Interfaces.ILancamentoOcorrencia
    {
        #region ILancamentoOcorrencia Members

        public Model.listaLancamentoOcorrencia buscaOcorrenciaByMeses( Model.LancamentoOcorrenciaModel olancamento, int mes)
        {
            try
            {
                Azuli.Web.DAO.LancamentoOcorrencia oLancamentoDAO = new Azuli.Web.DAO.LancamentoOcorrencia();

                return oLancamentoDAO.buscaOcorrenciaByMeses(olancamento, mes);
                
            }
            catch (Exception)
            {
                
                throw;
            }
        }


        #endregion
    }
}
