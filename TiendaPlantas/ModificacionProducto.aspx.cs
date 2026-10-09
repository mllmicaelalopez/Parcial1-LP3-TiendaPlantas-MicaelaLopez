using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Globalization;

namespace TiendaPlantas
{
    public partial class ModificacionProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            int codigo;

            if (!int.TryParse(txtCodigo.Text.Trim(), out codigo))
            {
                Mensaje("Ingresá un código numérico.", false);
                btnGuardar.Enabled = false;
                return;
            }

            try
            {
                SqlDataSourceProductos.SelectParameters["idProducto"].DefaultValue = codigo.ToString();
                SqlDataSourceProductos.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader datos = (SqlDataReader)SqlDataSourceProductos.Select(DataSourceSelectArguments.Empty);

                if (datos.Read())
                {
                    txtNombre.Text = datos["nombre"].ToString();
                    txtPrecio.Text = ((decimal)datos["precio"]).ToString("0.##");
                    ddlCategoria.SelectedValue = datos["idCategoria"].ToString();
                    lblMensaje.Text = "";
                    btnGuardar.Enabled = true;

                    ViewState["codigo"] = codigo;
                    ViewState["nombreOrig"] = txtNombre.Text;
                    ViewState["precioOrig"] = (decimal)datos["precio"];
                    ViewState["categoriaOrig"] = ddlCategoria.SelectedValue;
                }
                else
                {
                    txtNombre.Text = "";
                    txtPrecio.Text = "";
                    Mensaje("No existe un producto con el código " + codigo + ".", false);
                    btnGuardar.Enabled = false;
                }
                datos.Close();
            }
            catch (Exception ex)
            {
                Mensaje("Error al consultar la base de datos: " + ex.Message, false);
                btnGuardar.Enabled = false;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text.Trim();
            string precioTexto = txtPrecio.Text.Trim().Replace(',', '.');
            string categoria = ddlCategoria.SelectedValue;
            decimal precio;

            if (nombre == "")
            {
                Mensaje("El nombre no puede quedar vacío.", false);
                return;
            }
            if (!decimal.TryParse(precioTexto, NumberStyles.Number, CultureInfo.InvariantCulture, out precio) || precio <= 0)
            {
                Mensaje("Ingresá un precio válido (ej: 7500 o 7500,50).", false);
                return;
            }

            bool huboCambios = nombre != (string)ViewState["nombreOrig"]
                            || precio != (decimal)ViewState["precioOrig"]
                            || categoria != (string)ViewState["categoriaOrig"];

            if (!huboCambios)
            {
                Mensaje("No modificaste ningún campo. No hay nada para guardar.", false);
                return;
            }

            SqlDataSourceProductos.UpdateParameters["nombre"].DefaultValue = nombre;
            SqlDataSourceProductos.UpdateParameters["precio"].DefaultValue = precio.ToString(CultureInfo.InvariantCulture);
            SqlDataSourceProductos.UpdateParameters["idCategoria"].DefaultValue = categoria;
            SqlDataSourceProductos.UpdateParameters["idProducto"].DefaultValue = ViewState["codigo"].ToString();

            try
            {
                int filas = SqlDataSourceProductos.Update();
                if (filas == 1)
                {
                    Mensaje("Se modificó \"" + nombre + "\" correctamente.", true);
                    Registro.Guardar("MODIFICACIÓN", "Código " + ViewState["codigo"] + " - " + nombre
                        + " - $" + precio.ToString("0.##") + " - " + ddlCategoria.SelectedItem.Text);

                    ViewState["nombreOrig"] = nombre;
                    ViewState["precioOrig"] = precio;
                    ViewState["categoriaOrig"] = categoria;
                }
                else
                {
                    Mensaje("No se pudo modificar: el producto ya no existe.", false);
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
