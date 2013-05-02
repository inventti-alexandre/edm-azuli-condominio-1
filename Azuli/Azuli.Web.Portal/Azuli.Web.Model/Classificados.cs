using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Azuli.Web.Model
{


    public class Classificados
    {
        GrupoClassificados oGrp = new GrupoClassificados();
        ApartamentoModel oAp = new ApartamentoModel();

        public int idClassificado { get; set; }
        public GrupoClassificados grpClassificado;
        public Nullable<DateTime> dataClassificado { get; set; }
        public ApartamentoModel apartamentoClassificado;
        public string descricaoClassificado { get; set; }
        public string statusClassificado { get; set; }
        public Nullable<DateTime> validadeClassificado { get; set; }
        public string classificadoimg1 { get; set; }
        public string classificadoimg2 { get; set; }
        public string classificadoimg3 { get; set; }
        public string classificadoimg4 { get; set; }
        public string emailClassificadoContato { get; set; }
        public string classificadoTelefone1 { get; set; }
        public string classificadoTelefone2 { get; set; }
        public Nullable<DateTime> classificadoDataVenda { get; set; }
        public double valorVendaClassificado { get; set; }

        public Classificados()
        {
            idClassificado = 0;
            oGrp.grupoClassificado = 0;
            oAp.apartamento = 0;
            oAp.bloco = 0;
            dataClassificado = DateTime.Parse("01-01-1753");
            grpClassificado = oGrp;
            apartamentoClassificado = oAp;
            descricaoClassificado = "";
            statusClassificado = "";

        }



    }

    public class listClassificados : List<Classificados>
    {
    }
}
