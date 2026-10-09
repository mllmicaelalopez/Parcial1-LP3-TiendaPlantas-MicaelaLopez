<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TiendaPlantas.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Vivero Online - Inicio</title>
    <link href="estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="encabezado">
            <span class="logo">🌱 Vivero Online</span>
            <span class="subtitulo">Tienda de plantas - Panel de administración</span>
        </div>

        <div class="contenedor">
            <div class="tarjeta">
                <h1>Bienvenida</h1>
                <p class="ayuda">Elegí qué operación querés realizar sobre los productos.</p>

                <div class="menu">
                    <asp:HyperLink ID="lnkAlta" runat="server" CssClass="opcion" NavigateUrl="~/AltaProducto.aspx" Text="➕ Alta de productos" />
                    <asp:HyperLink ID="lnkConsulta" runat="server" CssClass="opcion" NavigateUrl="~/ConsultaProducto.aspx" Text="🔍 Consulta de productos" />
                    <asp:HyperLink ID="lnkModificacion" runat="server" CssClass="opcion" NavigateUrl="~/ModificacionProducto.aspx" Text="✏️ Modificación de productos" />
                    <asp:HyperLink ID="lnkBaja" runat="server" CssClass="opcion" NavigateUrl="~/BajaProducto.aspx" Text="🗑️ Baja de productos" />
                    <asp:HyperLink ID="lnkHistorial" runat="server" CssClass="opcion" NavigateUrl="~/Historial.aspx" Text="📄 Historial de operaciones" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
