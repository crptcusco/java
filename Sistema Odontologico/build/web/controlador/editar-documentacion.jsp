<%@page import="modelo.Documentacion"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="modelo.DataBaseHelper"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>

<%
    String nombre = "";
    String codigo ="";
    String ruta = "";
    String aux ="";
    boolean existeArchivo= false;
    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

// req es la HttpServletRequest que recibimos del formulario.
// Los items obtenidos serán cada uno de los campos del formulario,
// tanto campos normales como ficheros subidos.
    List items = upload.parseRequest(request);

// Se recorren todos los items, que son de tipo FileItem
    for (Object item : items) {
        FileItem uploaded = (FileItem) item;

        // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
        // subido donde nos interese
        if (!uploaded.isFormField()) {
            if(uploaded.getName()!= ""){
          
            // No es campo de formulario, guardamos el fichero en algún sitio
            System.out.println("Si entra a crear el archivo : " + uploaded.getName());
            File fichero = new File("C:/Users/Carlos/Desktop/SGCO - Sistema Odontologico/5.-Fuentes/Sistema Odontologico/web/docs/",uploaded.getName());
            aux = "../docs/" + uploaded.getName();
            uploaded.write(fichero);
            existeArchivo = true;}
        } else {
            // es un campo de formulario, podemos obtener clave y valor
            String key = uploaded.getFieldName();
            String valor = uploaded.getString();
            if (key.equals("nombre")) {
                nombre = valor;
            }
            if (key.equals("codigo")) {
                codigo = valor;
            }
            if (key.equals("ruta")) {
                ruta = valor;
            }
        }
    }

    if(existeArchivo){
        ruta=aux;
    }
    System.out.print( codigo + nombre + ruta);

//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Documentacion documentacion = new Documentacion(codigo,nombre,ruta);
    documentacion.modificar();
    response.sendRedirect("../administrador/documentacion.jsp");

%>
