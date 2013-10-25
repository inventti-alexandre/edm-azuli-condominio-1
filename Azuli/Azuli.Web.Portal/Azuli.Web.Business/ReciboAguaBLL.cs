using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Azuli.Web.DAO;
using Azuli.Web.Model;


namespace Azuli.Web.Business
{
    public class ReciboAguaBLL:Interfaces.IReciboAgua
    {

        #region IReciboAgua Members

        public listaSegundaViaAgua buscaTodosRecibos(ReciboAgua oReciboAguaModel)
        {
            throw new NotImplementedException();
        }

        public listaSegundaViaAgua buscaTodosRecibosByYearAndMonth(int ano)
        {
            throw new NotImplementedException();
        }

        public listaSegundaViaAgua buscaTodosRecibosByBlocoAndApto(ReciboAgua oReciboModel)
        {
            listaSegundaViaAgua oListReciboAgua;
            ReciboAguaDAO  oReciboDao = new ReciboAguaDAO();

            try
            {
                oListReciboAgua = oReciboDao.buscaTodosRecibosByBlocoAndApto(oReciboModel);

                return oListReciboAgua;

            }
            catch (Exception)
            {
                
                throw;
            }

        }

        #endregion
    }
}
