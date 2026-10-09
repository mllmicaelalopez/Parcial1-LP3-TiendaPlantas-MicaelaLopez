<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Historial.aspx.cs" Inherits="TiendaPlantas.Historial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Vivero Online - Historial de operaciones</title>
    <link href="estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="encabezado">
            <span class="logo">🌱 Vivero Online</span>
        </div>

        <div class="contenedor">
            <div class="tarjeta">
                <h2>Historial de operaciones</h2>
                <p class="ayuda">Cada alta, modificación y baja queda registrada en el archivo de texto App_Data/historial.txt.</p>

                <div class="historial">
                    <asp:Label ID="lblHistorial" runat="server" />
                </div>

                <asp:HyperLink ID="lnkVolver" runat="server" CssClass="volver" NavigateUrl="~/Default.aspx" Text="← Volver al inicio" />
            </div>
        </div>
    </form>
</body>
</html>
