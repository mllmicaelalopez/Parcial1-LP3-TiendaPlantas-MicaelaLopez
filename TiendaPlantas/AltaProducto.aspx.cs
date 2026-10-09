using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TiendaPlantas
{
    public partial class AltaProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text.Trim();
            string precioTexto = txtPrecio.Text.Trim().Replace(',', '.');
            decimal precio;

            if (nombre == "")
            {
                Mensaje("Ingresá el nombre de la planta.", false);
                return;
            }
            if (!decimal.TryParse(precioTexto, NumberStyles.Number, CultureInfo.InvariantCulture, out precio) || precio <= 0)
            {
                Mensaje("Ingresá un precio válido (ej: 7500 o 7500,50).", false);
                return;
            }

            SqlDataSourceProductos.InsertParameters["nombre"].DefaultValue = nombre;
            SqlDataSourceProductos.InsertParameters["precio"].DefaultValue = precio.ToString(CultureInfo.InvariantCulture);
            SqlDataSourceProductos.InsertParameters["idCategoria"].DefaultValue = ddlCategoria.SelectedValue;

            try
            {
                int filas = SqlDataSourceProductos.Insert();
                if (filas == 1)
                {
                    Mensaje("Se cargó \"" + nombre + "\" correctamente.", true);
                    Registro.Guardar("ALTA", nombre + " - $" + precio.ToString("0.##") + " - " + ddlCategoria.SelectedItem.Text);
                    txtNombre.Text = "";
                    txtPrecio.Text = "";
                }
                else
                {
                    Mensaje("No se pudo cargar el producto.", false);
                }
            }
            catch (Exception ex)
            {
                Mensaje("Error al guardar en la base de datos: " + ex.Message, false);
            }
        }

        private void Mensaje(string texto, bool ok)
        {
            lblMensaje.Text = texto;
            lblMensaje.CssClass = ok ? "mensaje ok" : "mensaje error";
        }
    }
}
