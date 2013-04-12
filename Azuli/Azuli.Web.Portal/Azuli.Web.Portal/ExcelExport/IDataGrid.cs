using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Azuli.Web.Portal.ExcelExport
{
   
        /// <summary>
        /// Interface which contains grid export management
        /// </summary>
        public interface IDataGrid
        {
            /// <summary>
            /// Exports the specified grid.
            /// </summary>
            /// <param name="grid">The grid.</param>
            void Export(System.Web.UI.WebControls.GridView grid);
            /// <summary>
            /// Exports the grid which contains paging.
            /// </summary>
            /// <param name="page">The current page which will exported.</param>
            /// <param name="grid">The grid used as reference to export data.</param>
            void ExportPaging(int page, System.Web.UI.WebControls.GridView grid);
        }

    
}