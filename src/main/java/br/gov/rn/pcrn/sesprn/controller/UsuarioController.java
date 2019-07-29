package br.gov.rn.pcrn.sesprn.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.gov.rn.pcrn.sesprn.anotacoes.Seguranca;
import br.gov.rn.pcrn.sesprn.anotacoes.Transacional;
import br.gov.rn.pcrn.sesprn.dao.DelegaciaDao;
import br.gov.rn.pcrn.sesprn.dao.UsuarioDao;
import br.gov.rn.pcrn.sesprn.dominio.Delegacia;
import br.gov.rn.pcrn.sesprn.dominio.TipoUsuario;
import br.gov.rn.pcrn.sesprn.dominio.Usuario;
import br.gov.rn.pcrn.sesprn.negocio.EntidadeNegocio;
import br.gov.rn.pcrn.sesprn.util.OpcaoSelect;

import javax.inject.Inject;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Optional;

/**
 * Created by SINF on 07/06/2019.
 */

@Controller
@Seguranca(tipoUsuario = TipoUsuario.ADMINISTRADOR)
public class UsuarioController extends Controlador {

    UsuarioDao usuarioDao;
    EntidadeNegocio entidadeNegocio;
    DelegaciaDao delegaciaDao;

    /**
     * @deprecated CDI eyes only
     */
    protected UsuarioController() {
        this(null, null, null, null);
    }

    @Inject
    public UsuarioController(UsuarioDao usuarioDao, Result resultado, EntidadeNegocio entidadeNegocio, DelegaciaDao delegaciaDao) {
        super(resultado);
        this.usuarioDao = usuarioDao;
        this.entidadeNegocio = entidadeNegocio;
        this.delegaciaDao = delegaciaDao;
    }

    @Seguranca(tipoUsuario = TipoUsuario.ADMINISTRADOR)
    public void form(){
        this.resultado.include("tipoUsuario", OpcaoSelect.toListaOpcoes(TipoUsuario.values()));
    }

    @Post("/usuarios")
    @Transacional
    public void salvar(Usuario usuario){
        if (usuario.getId() == null) {
            usuario.setDataCadastro(LocalDateTime.now());
            usuario.setDeletado(false);
        }
//        usuario.setSenha(criptografarSenha(usuario.getSenha()));
        this.usuarioDao.salvar(usuario);
        resultado.include("mensagem", new SimpleMessage("success","mensagem.salvar.sucesso"));
        resultado.redirectTo(UsuarioController.class).lista();
    }

    @Seguranca(tipoUsuario = TipoUsuario.ADMINISTRADOR)
    public void lista() {
        resultado.include("usuarios", usuarioDao.listar());
        resultado.include("delegacias", entidadeNegocio.geraListaOpcoesDelegacia());
    }

    @Seguranca(tipoUsuario = TipoUsuario.ADMINISTRADOR)
    public void editar(Long id) {
        Usuario usuario = usuarioDao.buscarPorId(id);
        this.resultado.include("tipoUsuario", OpcaoSelect.toListaOpcoes(TipoUsuario.values()));
        this.resultado.include("delegacias", entidadeNegocio.geraListaOpcoesDelegacia());
        this.resultado.include("usuario", usuario);
        resultado.of(this).form();
    }

    @Seguranca(tipoUsuario = TipoUsuario.ADMINISTRADOR)
    public void remover(Long id) {
        try {
            Usuario usuario = usuarioDao.buscarPorId(id);
            usuario.setDeletado(true);
            usuarioDao.salvar(usuario);
            resultado.include("mensagem", new SimpleMessage("success","mensagem.usuario.remover.sucesso"));
            resultado.of(this).lista();
        } catch (Exception e) {
            resultado.include("mensagem", new SimpleMessage("error", "mensagem.ususario.remover.error"));
            resultado.of(this).lista();
        }
    }

    @Transacional
    public void permitir(Long id, Long idDelegacia) {
        Usuario usuario = usuarioDao.buscarPorId(id);
        Delegacia delegacia = delegaciaDao.buscarPorId(idDelegacia);
        usuario.setDelegacia(delegacia);
        usuario.setPermissao(true);
        usuarioDao.salvar(usuario);
        resultado.include("mensagem", new SimpleMessage("success", "mensagem.usuario.permissao.aceita"));
        resultado.redirectTo(this).lista();
    }

    @Transacional
    public void desativar(Long id) {
        Usuario usuario = usuarioDao.buscarPorId(id);
        usuario.setPermissao(false);
        usuarioDao.salvar(usuario);
        resultado.include("mensagem", new SimpleMessage("success", "mensagem.usuario.permissao.negada"));
        resultado.redirectTo(this).lista();
    }

//    @Transacional
//    public void atualizar(Usuario usuario){
//        usuario.setDataCadastro(LocalDate.now());
//        this.usuarioDao.salvar(usuario);
//        resultado.include("mensagem", new SimpleMessage("success","mensagem.salvar.sucesso"));
//        resultado.redirectTo(InicioController.class).index();
//    }

//    @Transacional
//    public void trocarSenha(Usuario usuario) {
//        Usuario usuarioBanco = usuarioDao.buscarPorId(usuario.getId());
//        if(Criptografia.criptografar(usuario.getSenha()).equals(usuarioBanco.getSenha()) && usuario.getNovaSenha().equals(usuario.getConfirmaSenha())) {
//            usuarioBanco.setSenha(Criptografia.criptografar(usuario.getNovaSenha()));
//            resultado.include("mensagem", new SimpleMessage("success","mensagem.salvar.sucesso"));
//            resultado.redirectTo(InicioController.class).index();
//        } else {
//            resultado.include("mensagem", new SimpleMessage("error","mensagem.dadoIncorreto"));
//            resultado.redirectTo(PerfilController.class).form(usuario.getId());
//        }
//
//    }


//    private String criptografarSenha(String senha) {
//        return Criptografia.criptografar(senha);
//    }



}

