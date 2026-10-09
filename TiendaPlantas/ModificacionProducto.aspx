<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificacionProducto.aspx.cs" Inherits="TiendaPlantas.ModificacionProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Vivero Online - Modificación de productos</title>
    <link href="estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div class="encabezado">
            <span class="logo">🌱 Vivero Online</span>
        </div>

        <div class="contenedor">
            <div class="tarjeta">
                <h2>Modificación de productos</h2>
                <p class="ayuda">Buscá la planta por su código, cambiá los datos y guardá.</p>

                <div class="fila-busqueda">
                    <label for="txtCodigo"><strong>Código del producto</strong></label>
                    <asp:TextBox ID="txtCodigo" runat="server" CssClass="entrada entrada-corta" />
                    <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar" OnClick="btnBuscar_Click" />
                </div>

                <div class="campo">
                    <label for="txtNombre">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="entrada" MaxLength="50" />
                </div>
                <div class="campo">
                    <label for="txtPrecio">Precio</label>
                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="entrada" />
                </div>
                <div class="campo">
                    <label for="ddlCategoria">Categoría</label>
                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="entrada"
                        DataSourceID="SqlDataSourceCategorias"
                        DataTextField="descripcion" DataValueField="idCategoria" />
                </div>

                <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar cambios" Enabled="false" OnClick="btnGuardar_Click" />
                <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje" />

                <asp:HyperLink ID="lnkVolver" runat="server" CssClass="volver" NavigateUrl="~/Default.aspx" Text="← Volver al inicio" />
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server"
            ConnectionString="<%$ ConnectionStrings:tiendaplantas %>"
            SelectCommand="SELECT idCategoria, descripcion FROM categorias ORDER BY descripcion" />

        <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server"
            ConnectionString="<%$ ConnectionStrings:tiendaplantas %>"
            SelectCommand="SELECT nombre, precio, idCategoria FROM productos WHERE idProducto = @idProducto"
            UpdateCommand="UPDATE productos SET nombre = @nombre, precio = @precio, idCategoria = @idCategoria WHERE idProducto = @idProducto">
            <SelectParameters>
                <asp:Parameter Name="idProducto" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" />
                <asp:Parameter Name="precio" />
                <asp:Parameter Name="idCategoria" />
                <asp:Parameter Name="idProducto" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
