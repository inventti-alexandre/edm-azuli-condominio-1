using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Azuli.Web.Model
{
    public class AgendaModel
    {
        public DateTime dataAgendamento { get; set;}
        public ApartamentoModel ap { get; set;}
        public string salaoFesta { get; set; }
        public string salaoChurrasco { get; set;}
    }

    public class listAgenda : List<AgendaModel> { };
}
