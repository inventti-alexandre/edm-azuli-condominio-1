using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Azuli.Web.Model;

namespace Azuli.Web.Business.Interfaces
{
    public interface IAgenda
    {
         listAgenda listaEventos();
         listAgenda listaEventosByData(DateTime date);
         void cadastrarAgenda(DateTime data, ApartamentoModel oAp, AgendaModel oAgenda);
         listAgenda listaReservaByMorador(ApartamentoModel oAp, AgendaModel oAgenda);
         listAgenda listaReservaByMoradorFesta(ApartamentoModel oAp, AgendaModel oAgenda);
         void cancelaAgendamentoMorador(DateTime dataAgendamento, ApartamentoModel ap, bool festa, bool churras);
         listAgenda validaAgendamento(DateTime data, ApartamentoModel oAp, AgendaModel oAgenda);
         listAgenda listaReservaByMoradorAdmin(AgendaModel oAgenda);
         listAgenda listaReservaDetalhadaChurrasco(AgendaModel oAgenda);
         listAgenda listaReservaDetalhadaFesta(AgendaModel oAgenda);
    }
}
