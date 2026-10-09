<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaProducto.aspx.cs" Inherits="TiendaPlantas.ConsultaProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Vivero Online - Consulta de productos</title>
    <link href="estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="encabezado">
            <span class="logo">🌱 Vivero Online</span>
        </div>

        <div class="contenedor">
            <div class="tarjeta">
                <h2>Consulta de productos</h2>
                <p class="ayuda">Listado de todas las plantas con el nombre de su categoría (consulta con JOIN).</p>

                <asp:GridView ID="gvProductos" runat="server" CssClass="grilla" GridLines="None"
                    DataSourceID="SqlDataSourceConsulta"
                    AutoGenerateColumns="False"
                    EmptyDataText="No hay productos cargados.">
                    <Columns>
                        <asp:BoundField DataField="idProducto" HeaderText="Código" />
                        <asp:BoundField DataField="nombre" HeaderText="Planta" />
                        <asp:BoundField DataField="precio" HeaderText="Precio" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="categoria" HeaderText="Categoría" />
                    </Columns>
                </asp:GridView>

                <asp:HyperLink ID="lnkVolver" runat="server" CssClass="volver" NavigateUrl="~/Default.aspx" Text="← Volver al inicio" />
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSourceConsulta" runat="server"
            ConnectionString="<%$ ConnectionStrings:tiendaplantas %>"
            SelectCommand="SELECT p.idProducto, p.nombre, p.precio, c.descripcion AS categoria
                           FROM productos p
                           JOIN categorias c ON c.idCategoria = p.idCategoria
                           ORDER BY p.nombre" />
    </form>
</body>
</html>
