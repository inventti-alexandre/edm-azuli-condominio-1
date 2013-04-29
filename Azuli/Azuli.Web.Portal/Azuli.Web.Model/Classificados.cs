using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Azuli.Web.Model
{
    public class Classificados
    {
        public int idClassificado { get; set; }
        public GrupoClassificados grpClassificado;
        public DateTime dataClassificado { get; set; }
        public ApartamentoModel apartamentoClassificado;
        public string descricaoClassificado { get; set; }
        public string statusClassificado { get; set; }
        public DateTime validadeClassificado{ get; set; }
        public string classificadoimg1 { get; set; }
        public string classificadoimg2 { get; set; }
        public string classificadoimg3 { get; set; }
        public string classificadoimg4 { get; set; }
        public string emailClassificadoContato { get; set; }
        public string classificadoTelefone1 { get; set; }
        public string classificadoTelefone2 { get; set; }
        public DateTime classificadoDataVenda { get; set; }
        public double valorVendaClassificado { get; set;}



    }

    public class listClassificados : List<Classificados>
    {
    }
}
