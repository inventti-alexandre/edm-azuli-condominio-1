using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Azuli.Web.DAO;
using Azuli.Web.Model;
namespace Azuli.Web.Business
{
    public class MensagemMoradorBLL:Interfaces.IMensagemMorador
    {

        MensagemMoradorDAO oMensagemDAO = new MensagemMoradorDAO(); 

        #region IMensagemMorador Members

        public Model.listaMensagemMorador listaMensagemMorador(MensagemMoradorModel oAp)
        {
            try
            {
               return oMensagemDAO.listaMensagemMorador(oAp);
            }
            catch (Exception e)
            {

                throw e;
            }
        }

      


        public void enviaMensagemMorador(MensagemMoradorModel oMensagem)
        {
            try
            {
                oMensagemDAO.enviaMensagemMorador(oMensagem);
            }
            catch (Exception e)
            {

                throw e;
            }
        }

        #endregion
    }
}
