using System;
using System.IO;
using System.Web;

namespace TiendaPlantas
{
    public static class Registro
    {
        public static string Ruta()
        {
            return HttpContext.Current.Server.MapPath("~/App_Data/historial.txt");
        }

        public static void Guardar(string operacion, string detalle)
        {
            try
            {
                string ruta = Ruta();

                Directory.CreateDirectory(Path.GetDirectoryName(ruta));

                StreamWriter arch = new StreamWriter(ruta, true);
                arch.WriteLine(DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss") + " | " + operacion + " | " + detalle);
                arch.Close();
            }
            catch (Exception)
            {
            }
        }
    }
}
