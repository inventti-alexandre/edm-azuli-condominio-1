using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace Azuli.Web.Model
{
    class LancamentoOcorrenciaModel
    {

        public string ocorrenciaLancamento {get;set;}
        public DateTime dataOcorrencia { get; set; }
        public string statusOcorrencia { get; set; }
        public string descricaoOcorrencia { get; set; }
        public ApartamentoModel oAp { get; set; }
        public OcorrenciaModel oOcorrencia { get; set; }
        public DateTime dataFinalizacao { get; set; }
        public DateTime dataCancelamento { get; set; }

    }

}
