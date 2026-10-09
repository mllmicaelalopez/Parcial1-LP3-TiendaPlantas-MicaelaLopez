using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TiendaPlantas
{
    public partial class BajaProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void gvProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string nombre = gvProductos.SelectedDataKey["nombre"].ToString();
            lblMensaje.Text = "Seleccionaste: " + nombre;
            lblMensaje.CssClass = "mensaje info";
            btnEliminar.Enabled = true;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (gvProductos.SelectedIndex < 0)
            {
                Mensaje("Primero seleccioná una planta.", false);
                return;
            }

            string id = gvProductos.SelectedDataKey["idProducto"].ToString();
            string nombre = gvProductos.SelectedDataKey["nombre"].ToString();

            try
            {
                SqlDataSourceBaja.DeleteParameters["idProducto"].DefaultValue = id;
                int filas = SqlDataSourceBaja.Delete();

                gvProductos.SelectedIndex = -1;
                gvProductos.DataBind();
                btnEliminar.Enabled = false;

                if (filas == 1)
                {
                    Mensaje("Se eliminó \"" + nombre + "\" correctamente.", true);
                    Registro.Guardar("BAJA", "Código " + id + " - " + nombre);
                }
                else
                {
                    Mensaje("No se pudo eliminar: el producto ya no existe.", false);
                }
            }
            catch (Exception ex)
            {
                Mensaje("Error al eliminar en la base de datos: " + ex.Message, false);
            }
        }

        private void Mensaje(string texto, bool ok)
        {
            lblMensaje.Text = texto;
            lblMensaje.CssClass = ok ? "mensaje ok" : "mensaje error";
        }
    }
}
