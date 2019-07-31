package br.gov.rn.pcrn.sesprn.controller;


import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadSizeLimit;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.gov.rn.pcrn.sesprn.anotacoes.Transacional;
import br.gov.rn.pcrn.sesprn.dao.DelegaciaDao;
import br.gov.rn.pcrn.sesprn.dao.EntidadeDao;
import br.gov.rn.pcrn.sesprn.dominio.Delegacia;
import br.gov.rn.pcrn.sesprn.dominio.Usuario;
import br.gov.rn.pcrn.sesprn.negocio.EntidadeNegocio;

import javax.inject.Inject;
import java.io.IOException;
import java.util.List;

@Controller
public class DelegaciaController extends Controlador{

    private EntidadeDao<Delegacia> dao;
    private DelegaciaDao delegaciaDao;
    private EntidadeNegocio entidadeNegocio;
    private Validator validator;

    @Deprecated
    protected DelegaciaController() { this(null, null, null,
            null, null); }

    @Inject
    public DelegaciaController(Result resultado, EntidadeDao<Delegacia> dao, DelegaciaDao delegaciaDao,
                               EntidadeNegocio entidadeNegocio, Validator validator) {
        super(resultado);
        this.dao = dao;
        this.delegaciaDao = delegaciaDao;
        this.entidadeNegocio = entidadeNegocio;
        this.validator = validator;
    }

    public void form(){
    }

    @Post
    @Transacional
    @UploadSizeLimit(sizeLimit = 40 * 1024 * 1024, fileSizeLimit = 10 * 1024 * 1024)
    public void salvar(Delegacia delegacia) throws IOException {
        validator.onErrorRedirectTo(this).form();

        dao.salvar(delegacia);
        resultado.redirectTo(this).lista();
    }

    public void lista() {
        resultado.include("delegacias", dao.listar());
        resultado.include("regionais", entidadeNegocio.geraListaOpcoesRegional());
    }

    public void editar(Long id) {
        Delegacia delegacia = dao.buscarPorId(id);
        resultado.include("delegacia", delegacia);
        resultado.include("regionais", entidadeNegocio.geraListaOpcoesRegional());
        resultado.of(this).form();
    }

    @Transacional
    public void remover(Long id) {
        Delegacia delegacia = this.dao.buscarPorId(id);
        List<Usuario> usuarios = delegaciaDao.buscarUsuariosPorDelegacia(id);
        if (!usuarios.isEmpty()) {
            resultado.include("usuarios", usuarios);
            resultado.include("mensagem", new SimpleMessage("error", "mensagem.delegacia.remover.error.usuarioAtivo"));
            resultado.redirectTo(this).lista();
        } else {
            delegacia.setDeletado(true);
            this.dao.salvar(delegacia);
            resultado.include("mensagem", new SimpleMessage("success", "mensagem.delegacia.remover.sucesso"));
            resultado.redirectTo(this).lista();
        }
    }

//    public void download(Long id) {
//        Delegacia delegacia = dao.buscarPorId(id);
//
//        resultado.of(this).lista();
//    }

    @Transacional
    @Post
    public void salvarAjax(Delegacia delegacia) {
        dao.salvar(delegacia);
        resultado.use(Results.json()).withoutRoot().from(delegacia).recursive().serialize();
    }

}

