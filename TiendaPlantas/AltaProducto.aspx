<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaProducto.aspx.cs" Inherits="TiendaPlantas.AltaProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Vivero Online - Alta de productos</title>
    <link href="estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div class="encabezado">
            <span class="logo">🌱 Vivero Online</span>
        </div>

        <div class="contenedor">
            <div class="tarjeta">
                <h2>Alta de productos</h2>
                <p class="ayuda">Completá los datos de la planta nueva y presioná Confirmar.</p>

                <div class="campo">
                    <label for="txtNombre">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="entrada" MaxLength="50" placeholder="Ej: Monstera" />
                </div>
                <div class="campo">
                    <label for="txtPrecio">Precio</label>
                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="entrada" placeholder="Ej: 7500 o 7500,50" />
                </div>
                <div class="campo">
                    <label for="ddlCategoria">Categoría</label>
                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="entrada"
                        DataSourceID="SqlDataSourceCategorias"
                        DataTextField="descripcion" DataValueField="idCategoria" />
                </div>

                <asp:Button ID="btnConfirmar" runat="server" CssClass="boton" Text="Confirmar" OnClick="btnConfirmar_Click" />
                <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje" />

                <asp:HyperLink ID="lnkVolver" runat="server" CssClass="volver" NavigateUrl="~/Default.aspx" Text="← Volver al inicio" />
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server"
            ConnectionString="<%$ ConnectionStrings:tiendaplantas %>"
            SelectCommand="SELECT idCategoria, descripcion FROM categorias ORDER BY descripcion" />

        <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server"
            ConnectionString="<%$ ConnectionStrings:tiendaplantas %>"
            InsertCommand="INSERT INTO productos (nombre, precio, idCategoria) VALUES (@nombre, @precio, @idCategoria)">
            <InsertParameters>
                <asp:Parameter Name="nombre" />
                <asp:Parameter Name="precio" />
                <asp:Parameter Name="idCategoria" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
