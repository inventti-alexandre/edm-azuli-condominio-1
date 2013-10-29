using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Azuli.Web.Model;
using System.Data;
using System.Data.SqlClient;

namespace Azuli.Web.DAO
{
    public class ReciboAguaDAO:AcessoDAO, Interfaces.IReciboAgua
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
            string clausulaSql = "SP_RECIBO_WEB_BLOCO_AP";

            try
            {
                SqlCommand comandoSQL = new SqlCommand(clausulaSql);

                comandoSQL.Parameters.AddWithValue("@BLOCO", oReciboModel.bloco);
                comandoSQL.Parameters.AddWithValue("@AP", oReciboModel.apartamento);
                comandoSQL.Parameters.AddWithValue("@Mes", oReciboModel.ano);
                comandoSQL.Parameters.AddWithValue("@Ano", oReciboModel.mes);

                DataTable tbRecibo = new DataTable();

                tbRecibo = ExecutaQuery(comandoSQL);

                return populaSegundaViaAgua(tbRecibo);


            }
            catch (Exception)
            {
                
                throw;
            }
        }

        #endregion




        private listaSegundaViaAgua populaSegundaViaAgua(DataTable dt)
        {
            listaSegundaViaAgua oListReciboAgua = new listaSegundaViaAgua();


            foreach (DataRow itemOcorrencia in dt.Rows)
            {
                ReciboAgua oReciboAgua = new ReciboAgua();

                if (itemOcorrencia.Table.Columns.Contains("ID - Condomínio"))
                    oReciboAgua.idCondominio = itemOcorrencia["ID - Condomínio"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Nome do Condomínio"))
                    oReciboAgua.nomeCondominio = itemOcorrencia["Nome do Condomínio"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Endereço do Condomínio"))
                    oReciboAgua.enderecoCondominio = itemOcorrencia["Endereço do Condomínio"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Bloco"))
                    oReciboAgua.bloco = itemOcorrencia["Bloco"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Apartamento"))
                    oReciboAgua.apartamento = itemOcorrencia["Apartamento"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Regitro"))
                    oReciboAgua.registro = itemOcorrencia["Regitro"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Fechamento Atual"))
                    oReciboAgua.fechamentoAtual = itemOcorrencia["Fechamento Atual"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Data leitura Anterior"))
                    oReciboAgua.dataLeituraAnterior = itemOcorrencia["Data leitura Anterior"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Data leitura Atual"))
                    oReciboAgua.dataLeituraAtual = itemOcorrencia["Data leitura Atual"].ToString();


                

                if (itemOcorrencia.Table.Columns.Contains("leitura Anterior M³"))
                    oReciboAgua.leituraAnteriorM3 = itemOcorrencia["leitura Anterior M³"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Leitura Atual M³"))
                    oReciboAgua.leituraAtualM3 = itemOcorrencia["Leitura Atual M³"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Consumo do mês M³"))
                    oReciboAgua.consumoMesM3 = itemOcorrencia["Consumo do mês M³"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Data da próxima leitura"))
                    oReciboAgua.dataProximaLeitura = itemOcorrencia["Data da próxima leitura"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Status"))
                    oReciboAgua.status = itemOcorrencia["Status"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Média"))
                    oReciboAgua.media = itemOcorrencia["Média"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Histórico descrição mês1"))
                    oReciboAgua.historicoDescricaoMes1 = itemOcorrencia["Histórico descrição mês1"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Histórico descrição mês2"))
                    oReciboAgua.historicoDescricaoMes2 = itemOcorrencia["Histórico descrição mês2"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Histórico descrição mês3"))
                    oReciboAgua.historicoDescricaoMes3 = itemOcorrencia["Histórico descrição mês3"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Histórico descrição mês4"))
                    oReciboAgua.historicoDescricaoMes4 = itemOcorrencia["Histórico descrição mês4"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Histórico descrição mês5"))
                    oReciboAgua.historicoDescricaoMes5 = itemOcorrencia["Histórico descrição mês5"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Histórico descrição mês6"))
                    oReciboAgua.historicoDescricaoMes6 = itemOcorrencia["Histórico descrição mês6"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Histórico mês1"))
                    oReciboAgua.historicoMes1 = itemOcorrencia["Histórico mês1"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Histórico mês2"))
                    oReciboAgua.historicoMes2 = itemOcorrencia["Histórico mês2"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Histórico mês3"))
                    oReciboAgua.historicoMes3 = itemOcorrencia["Histórico mês3"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Histórico mês4"))
                    oReciboAgua.historicoMes4 = itemOcorrencia["Histórico mês4"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Histórico mês5"))
                    oReciboAgua.historicoMes5 = itemOcorrencia["Histórico mês5"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Histórico mês6"))
                    oReciboAgua.historicoMes6 = itemOcorrencia["Histórico mês6"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Imagem"))
                    oReciboAgua.imagem = itemOcorrencia["Imagem"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Pago pelo condomínio - Consumo M³"))
                    oReciboAgua.consumoM3pagoCondominio = Convert.ToInt32(itemOcorrencia["Pago pelo condomínio - Consumo M³"]);


                if (itemOcorrencia.Table.Columns.Contains("Pago pelo condomínio - Consumo Valor"))
                    oReciboAgua.ConsumoValorPagoCondominio = Convert.ToDecimal(itemOcorrencia["Pago pelo condomínio - Consumo Valor"]);

                if (itemOcorrencia.Table.Columns.Contains("Pago pelo condomínio - Mínimo M³"))
                    oReciboAgua.minimoM3PagoCondominio = Convert.ToInt32(itemOcorrencia["Pago pelo condomínio - Mínimo M³"]);

                if (itemOcorrencia.Table.Columns.Contains("Pago pelo condomínio - Mínimo Valor"))
                    oReciboAgua.minimoValorPagoCondominio = Convert.ToInt32(itemOcorrencia["Pago pelo condomínio - Mínimo Valor"]);

                if (itemOcorrencia.Table.Columns.Contains("Pago pelo condomínio - Excedente M³"))
                    oReciboAgua.excedenteM3PagoCondominio = Convert.ToInt32(itemOcorrencia["Pago pelo condomínio - Excedente M³"]);

                if (itemOcorrencia.Table.Columns.Contains("Pago pelo condomínio - Excedente Valor"))
                    oReciboAgua.excedenteValorPagoCondominio = Convert.ToDecimal(itemOcorrencia["Pago pelo condomínio - Excedente Valor"]);

                if (itemOcorrencia.Table.Columns.Contains("Valor de Rateio - Excedente M³"))
                    oReciboAgua.excedenteM3Rateio = Convert.ToInt32(itemOcorrencia["Valor de Rateio - Excedente M³"]);

                if (itemOcorrencia.Table.Columns.Contains("Valor de Rateio - Excedente Valor"))
                    oReciboAgua.excedenteValorRateio = Convert.ToDecimal(itemOcorrencia["Valor de Rateio - Excedente Valor"]);

                if (itemOcorrencia.Table.Columns.Contains("Valor Devido - Tarifa Mínima M³"))
                    oReciboAgua.tarifaMinimaM3ValorDevido = Convert.ToInt32(itemOcorrencia["Valor Devido - Tarifa Mínima M³"]);

                if (itemOcorrencia.Table.Columns.Contains("Valor Devido - Tarifa Mínima Valor"))
                    oReciboAgua.tarifaMinimaValorValorDevido = Convert.ToDecimal(itemOcorrencia["Valor Devido - Tarifa Mínima Valor"]);

                if (itemOcorrencia.Table.Columns.Contains("Valor Devido - Excedente"))
                    oReciboAgua.excedenteValorDevido = Convert.ToDecimal(itemOcorrencia["Valor Devido - Excedente"]);

                if (itemOcorrencia.Table.Columns.Contains("Valor Devido - a pagar"))
                    oReciboAgua.valorPagarValorDevido = Convert.ToDecimal(itemOcorrencia["Valor Devido - a pagar"]);

                if (itemOcorrencia.Table.Columns.Contains("Aviso - Geral"))
                    oReciboAgua.avisoGeralAviso = itemOcorrencia["Aviso - Geral"].ToString() ;

                if (itemOcorrencia.Table.Columns.Contains("Aviso - Anormal"))
                    oReciboAgua.AnormalAviso = itemOcorrencia["Aviso - Anormal"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Aviso - Individual"))
                    oReciboAgua.individualAviso = itemOcorrencia["Aviso - Individual"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Aviso - ANORMALIDADE"))
                    oReciboAgua.anormalidadeAviso = itemOcorrencia["Aviso - ANORMALIDADE"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Aviso - Geral"))
                    oReciboAgua.avisoGeralAviso = itemOcorrencia["Aviso - Geral"].ToString();

                if (itemOcorrencia.Table.Columns.Contains("Consuta - Mes"))
                    oReciboAgua.mes = Convert.ToInt32(itemOcorrencia["Consuta - Mes"]);

                if (itemOcorrencia.Table.Columns.Contains("Consulta - Ano"))
                    oReciboAgua.ano = Convert.ToInt32(itemOcorrencia["Consulta - Ano"]);


                oListReciboAgua.Add(oReciboAgua);


            }

            return oListReciboAgua;
        }
    }
}
