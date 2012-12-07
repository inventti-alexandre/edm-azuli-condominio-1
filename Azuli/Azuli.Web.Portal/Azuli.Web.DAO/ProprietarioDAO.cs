using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Azuli.Web.Model;

namespace Azuli.Web.DAO
{
    public class ProprietarioDAO:AcessoDAO, Interfaces.IProprietario
    {

        #region IProprietario Members

        public int autenticaMorador(Model.ApartamentoModel ap, Model.ProprietarioModel apPro)
        {

            string clausulaSQL = "AUTENTICA_MORADOR";

            populaProprietario(ap, apPro);

            try
            {
                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);
                comandoSQL.Parameters.AddWithValue("@PROPRIETARIO_AP", ap.apartamento);
                comandoSQL.Parameters.AddWithValue("@PROPRIETARIO_BLOCO", ap.bloco);
                comandoSQL.Parameters.AddWithValue("@SENHA", apPro.senha);
                SqlParameter retornoLogin = new SqlParameter("@RETORNO", SqlDbType.Int);
                retornoLogin.Direction = ParameterDirection.Output;
                comandoSQL.Parameters.Add(retornoLogin);
                
                ExecutaComando(comandoSQL);

                return int.Parse(comandoSQL.Parameters["@RETORNO"].Value.ToString());
            }
            catch (Exception)
            {
                
                throw;
            }
        }


        public int CadastrarApartamentoMorador(Model.ProprietarioModel ap)
        {

            string clausulaSQL = "CADASTRA_MORADOR_APARTAMENTO";

           

            try
            {
                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);
                comandoSQL.Parameters.AddWithValue("@BLOCO", ap.ap.bloco);
                comandoSQL.Parameters.AddWithValue("@AP", ap.ap.apartamento);
                comandoSQL.Parameters.AddWithValue("@MORADOR1", ap.proprietario1);
                comandoSQL.Parameters.AddWithValue("@MORADOR2", ap.proprietario2);
                comandoSQL.Parameters.AddWithValue("@senha", ap.senha);
                SqlParameter retornoCadastro = new SqlParameter("@RETORNO", SqlDbType.Int);
                retornoCadastro.Direction = ParameterDirection.Output;
                comandoSQL.Parameters.Add(retornoCadastro);
                
                
                ExecutaComando(comandoSQL);

                return int.Parse(comandoSQL.Parameters["@RETORNO"].Value.ToString());
            }
            catch (Exception)
            {

                throw;
            }
        }




        public listProprietario BuscaMoradorAdmin(ApartamentoModel ap)
        {
            string clausulaSQL = "BUSCA_MORADOR_ADMIN";

            try
            {

                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);
                comandoSQL.Parameters.AddWithValue("@PROPRIETARIO_AP", ap.apartamento);
                comandoSQL.Parameters.AddWithValue("@PROPRIETARIO_BLOCO", ap.bloco);
       
                DataTable tbProprietario = new DataTable();

                tbProprietario = ExecutaQuery(comandoSQL);

                return listaAp(tbProprietario);


            }
            catch (Exception)
            {

                throw;
            }
        }



        public void alteraSenha(ProprietarioModel oProprietario)
        {
            string clausulaSQL = "ALTERA_SENHA";

            try
            {

                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);
                comandoSQL.Parameters.AddWithValue("@PROPRIETARIO_AP", oProprietario.ap.apartamento);
                comandoSQL.Parameters.AddWithValue("@PROPRIETARIO_BLOCO", oProprietario.ap.bloco);
                comandoSQL.Parameters.AddWithValue("@NOVA_SENHA", oProprietario.senha);

                ExecutaQuery(comandoSQL);

            }
            catch (Exception e) 
            {

                throw e;
            }


        }



        public Model.listProprietario listaAp(DataTable dt)
        {
            listProprietario oListProprietario = new listProprietario();

            foreach (DataRow dr in dt.Rows)
            {
                ProprietarioModel oPropri = new ProprietarioModel();
                oPropri.ap = new ApartamentoModel();

                oPropri.proprietario1 = dr["NOME_PROPRIETARIO1"].ToString();
                oPropri.proprietario2 = dr["NOME_PROPRIETARIO2"].ToString();
                oPropri.ap.bloco = int.Parse(dr["PROPRIETARIO_BLOCO"].ToString());
                oPropri.ap.apartamento = int.Parse(dr["PROPRIETARIO_AP"].ToString());

                oListProprietario.Add(oPropri);

            }

            return oListProprietario;
        }
       
 

        public listProprietario populaProprietario(ApartamentoModel ap,ProprietarioModel apPro)
        {
            string clausulaSQL = "POPULA_MORADOR";

            try
            {

                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);
                comandoSQL.Parameters.AddWithValue("@PROPRIETARIO_AP", ap.apartamento);
                comandoSQL.Parameters.AddWithValue("@PROPRIETARIO_BLOCO", ap.bloco);
                comandoSQL.Parameters.AddWithValue("@SENHA", apPro.senha);

                DataTable tbProprietario = new DataTable();

                tbProprietario = ExecutaQuery(comandoSQL);

                return listaAp(tbProprietario);


            }
            catch (Exception)
            {
                
                throw;
            }
        }

      
        listApartamento Interfaces.IProprietario.listaAp(DataTable dt)
        {
            throw new NotImplementedException();
        }

     

        #endregion
    }
}
