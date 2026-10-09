<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BajaProducto.aspx.cs" Inherits="TiendaPlantas.BajaProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Vivero Online - Baja de productos</title>
    <link href="estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="encabezado">
            <span class="logo">🌱 Vivero Online</span>
        </div>

        <div class="contenedor">
            <div class="tarjeta">
                <h2>Baja de productos</h2>
                <p class="ayuda">Seleccioná la planta que querés eliminar y presioná "Eliminar seleccionado".</p>

                <asp:GridView ID="gvProductos" runat="server" CssClass="grilla" GridLines="None"
                    OnSelectedIndexChanged="gvProductos_SelectedIndexChanged"
                    DataSourceID="SqlDataSourceBaja"
                    AutoGenerateColumns="False"
                    AutoGenerateSelectButton="True"
                    DataKeyNames="idProducto,nombre"
                    SelectedRowStyle-CssClass="fila-seleccionada"
                    EmptyDataText="No hay productos cargados.">
                    <Columns>
                        <asp:BoundField DataField="idProducto" HeaderText="Código" />
                        <asp:BoundField DataField="nombre" HeaderText="Planta" />
                        <asp:BoundField DataField="precio" HeaderText="Precio" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="categoria" HeaderText="Categoría" />
                    </Columns>
                </asp:GridView>
                <br />

                <asp:Button ID="btnEliminar" runat="server" CssClass="boton boton-peligro" Text="Eliminar seleccionado" Enabled="false"
                    OnClick="btnEliminar_Click"
                    OnClientClick="return confirm('¿Seguro que querés eliminar esta planta? Esta acción no se puede deshacer.');" />
                <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje" />

                <asp:HyperLink ID="lnkVolver" runat="server" CssClass="volver" NavigateUrl="~/Default.aspx" Text="← Volver al inicio" />
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSourceBaja" runat="server"
            ConnectionString="<%$ ConnectionStrings:tiendaplantas %>"
            SelectCommand="SELECT p.idProducto, p.nombre, p.precio, c.descripcion AS categoria
                           FROM productos p
                           JOIN categorias c ON c.idCategoria = p.idCategoria
                           ORDER BY p.nombre"
            DeleteCommand="DELETE FROM productos WHERE idProducto = @idProducto">
            <DeleteParameters>
                <asp:Parameter Name="idProducto" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
