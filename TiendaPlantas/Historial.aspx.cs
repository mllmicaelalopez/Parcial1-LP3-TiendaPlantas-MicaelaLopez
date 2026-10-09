using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TiendaPlantas
{
    public partial class Historial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ruta = Registro.Ruta();

            if (File.Exists(ruta))
            {
                StreamReader arch = new StreamReader(ruta);
                string contenido = arch.ReadToEnd();
                arch.Close();

                lblHistorial.Text = Server.HtmlEncode(contenido).Replace(Environment.NewLine, "<br />");
            }
            else
            {
                lblHistorial.Text = "Todavía no hay operaciones registradas.";
            }
        }
    }
}
