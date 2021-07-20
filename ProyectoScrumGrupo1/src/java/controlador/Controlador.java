/*
    Programador: Bonifasi de León, Marcos Daniel
        - PE5AM
        - 2019139
    Fecha de Creación: 06/10/2020.
*/
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Persona;
import modelo.Usuario;
import modeloDAO.PersonaDAO;
import modeloDAO.RolDAO;
import modeloDAO.UsuarioDAO;


public class Controlador extends HttpServlet {

    private final String PATH_LISTAR = "view/listar.jsp";
    private final String PATH_EDITAR = "view/editar.jsp";
    private final String PATH_AGREGAR = "view/add.jsp";
    private final String PATH_LISTAR_COMUN = "view/listar-comun.jsp";
    private final String PATH_LOGIN = "view/../index.jsp";
    private Persona nuevaPersona = new Persona();
    private PersonaDAO nuevaPersonaDAO = new PersonaDAO();
    int codigoPersona;
    String nombreUsuario = "";
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acceso = "";
        String action = request.getParameter("accion");
        
        if(action.equalsIgnoreCase("listar")){
            acceso = PATH_LISTAR;
        } else if (action.equalsIgnoreCase("add")){
            acceso = PATH_AGREGAR;
        } else if (action.equalsIgnoreCase("Agregar")){
            String DPI = request.getParameter("txtDPI");
            String nombrePersona = request.getParameter("txtNombre");
            
            nuevaPersona.setDPI(DPI);
            nuevaPersona.setNombrePersona(nombrePersona);
            
            nuevaPersonaDAO.add(nuevaPersona);
            acceso = PATH_LISTAR;
        } else if (action.equalsIgnoreCase("editar")){
            request.setAttribute("codPer",request.getParameter("codigoPersona"));
            acceso = PATH_EDITAR;
        } else if (action.equalsIgnoreCase("Actualizar")){
            codigoPersona = Integer.parseInt(request.getParameter("txtCodigoPersona"));
            String dpi = request.getParameter("txtDPI");
            String nombres = request.getParameter("txtNombre");
            nuevaPersona.setCodigoPersona(codigoPersona);
            nuevaPersona.setDPI(dpi);
            nuevaPersona.setNombrePersona(nombres);
            nuevaPersonaDAO.edit(nuevaPersona);
            acceso = PATH_LISTAR;
        } else if (action.equalsIgnoreCase("eliminar")){
            codigoPersona = Integer.parseInt(request.getParameter("codigoPersona"));
            nuevaPersona.setCodigoPersona(codigoPersona);
            nuevaPersonaDAO.eliminar(codigoPersona);
            acceso = PATH_LISTAR;
        }else if (action.equalsIgnoreCase("regresar")){
            acceso = PATH_LOGIN;
        }
        request.setAttribute("user", this.nombreUsuario);
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        RolDAO rolDAO = new RolDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        
        //Obteniendo los parametros
        String nombreUsuario = request.getParameter("txtUsername");
        String nuevaPassword = request.getParameter("txtPassword");
        int tipoUsuario = Integer.parseInt(request.getParameter("sTypeOfUser"));
        
        Usuario usuario = usuarioDAO.list(nombreUsuario);
        String password = "";
        
        //Validando
        if(rolDAO.list(tipoUsuario) != null && rolDAO.list(tipoUsuario).getCodigoRol() == usuario.getCodigoRol() && tipoUsuario == 1){
            password = usuario.getUsuarioPassword();
            
            if(usuario != null &&  password.equals(nuevaPassword)){    
                acceso = PATH_LISTAR;
            }else {
                System.out.println("No existe ese usuario administrador");
            }
            
        }else if(rolDAO.list(tipoUsuario) != null && rolDAO.list(tipoUsuario).getCodigoRol() == usuario.getCodigoRol() && tipoUsuario == 2){
            password = usuario.getUsuarioPassword();
            
            if(usuario != null && password.equals(nuevaPassword)){
                acceso = PATH_LISTAR_COMUN;
            }else {
                System.out.println("No existe ese usuario comun");
            }

        }
        this.nombreUsuario =  usuario.getNombreUsuario();
        request.setAttribute("user", usuario.getNombreUsuario());
        
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
