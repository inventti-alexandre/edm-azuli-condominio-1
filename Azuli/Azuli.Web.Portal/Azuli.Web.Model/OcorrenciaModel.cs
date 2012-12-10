using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Azuli.Web.Model
{
    public class OcorrenciaModel
    {
        public LancamentoOcorrenciaModel oLancamentoOcorrencia { get; set; }
        public string descricaoOcorrencia { get; set; }
        public string statusOcorrencia { get; set;}
        public DateTime dataCadastroOcorrencia { get; set; }

    }

    public class listaOcorrencia : List<OcorrenciaModel> { }
}
