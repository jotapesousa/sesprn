package br.gov.rn.pcrn.sesprn.controller;

import br.com.caelum.vraptor.*;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.gov.rn.pcrn.sesprn.anotacoes.Transacional;
import br.gov.rn.pcrn.sesprn.dao.UsuarioDao;
import br.gov.rn.pcrn.sesprn.dominio.Usuario;
import br.gov.rn.pcrn.sesprn.dominio.UsuarioLogado;
import br.gov.rn.pcrn.sesprn.negocio.LoginNegocio;

import javax.inject.Inject;
import javax.naming.NamingException;
import java.io.IOException;


@Controller
public class LoginController extends Controlador {

    private UsuarioLogado usuarioLogado;
    private UsuarioDao usuarioDao;
    private LoginNegocio loginNegocio;

    @Deprecated
    LoginController(){
        this(null,null,null, null);
    }

    @Inject
    public LoginController(UsuarioLogado usuarioLogado, Result resultado, UsuarioDao usuarioDao, LoginNegocio loginNegocio) {
        super(resultado);
        this.usuarioLogado = usuarioLogado;
        this.usuarioDao = usuarioDao;
        this.loginNegocio = loginNegocio;
    }

    @Post("/login")
    @Transacional
    public void login(Usuario usuario) throws IOException, NamingException {
        if (usuario.getLogin() == null) {
            resultado.include("mensagem", new SimpleMessage("error","login.campoBranco"));
            resultado.of(this).form();
        } else if (usuario.getSenha() == null) {
            resultado.include("mensagem", new SimpleMessage("error","login.campoBranco"));
            resultado.of(this).form();
        } else {
            //        Usuario usuarioLogin = loginNegocio.validarUsuario(usuario);
            Usuario usuarioLogin = loginNegocio.ldapAuth(usuario);

            if (usuarioLogin == null) {
                resultado.include("mensagem", new SimpleMessage("error","login.dadoIncorreto"));
                resultado.of(this).form();
            } else if (!usuarioLogin.isPermitido()) {
                resultado.include("mensagem", new SimpleMessage("error","login.permissaoUsuario"));
                resultado.of(this).form();
            } else {
                usuarioLogado.setUsuario(usuarioLogin);
                resultado.redirectTo(IndexController.class).index();
            }
        }
    }

    @Path("/")
    public void form(){

    }

    @Get("/logout")
    public void logout(){
        this.usuarioLogado.desloga();
        this.resultado.redirectTo(LoginController.class).form();
    }
}
