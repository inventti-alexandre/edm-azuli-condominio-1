using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Azuli.Web.DAO;
using Azuli.Web.Model;

namespace Azuli.Web.Business
{
    public class ProprietarioBLL:Interfaces.IProprietario
    {

        #region IProprietario Members

        public int autenticaMorador(Model.ApartamentoModel ap, Model.ProprietarioModel apPro)
        {
            try
            {
                ProprietarioDAO oProprietario = new ProprietarioDAO();

                return oProprietario.autenticaMorador(ap,apPro);

            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public Model.listProprietario populaProprietario(Model.ApartamentoModel ap, Model.ProprietarioModel apPro)
        {
            try
            {
                ProprietarioDAO oPropriDAO = new ProprietarioDAO();
                
                return oPropriDAO.populaProprietario(ap, apPro);

            }
            catch (Exception e)
            {
                
                throw e;
            }
        }

       
        public Model.listProprietario BuscaMoradorAdmin(Model.ApartamentoModel ap)
        {
            try
            {
                ProprietarioDAO oPropriDAO = new ProprietarioDAO();

                return oPropriDAO.BuscaMoradorAdmin(ap);

            }
            catch (Exception e)
            {

                throw e;
            }
        }

        #endregion

        #region IProprietario Members


        public Model.listApartamento listaAP(System.Data.DataTable dt)
        {
            throw new NotImplementedException();
        }

        public void alteraSenha(ProprietarioModel oProprietario)
        {

            try
            {
                ProprietarioDAO oPropriDAO = new ProprietarioDAO();

                oPropriDAO.alteraSenha(oProprietario);

            }
            catch (Exception e)
            {

                throw e;
            }
            
        }

        
        public int CadastrarApartamentoMorador(ProprietarioModel ap)
        {
            try
            {
                ProprietarioDAO oPropriDAO = new ProprietarioDAO();

                return oPropriDAO.CadastrarApartamentoMorador(ap);

            }
            catch (Exception e)
            {

                throw e;
            }

        }

     


       

        #endregion
    }
}
