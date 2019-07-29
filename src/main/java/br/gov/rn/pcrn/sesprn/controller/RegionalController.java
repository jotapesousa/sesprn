package br.gov.rn.pcrn.sesprn.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.gov.rn.pcrn.sesprn.anotacoes.Transacional;
import br.gov.rn.pcrn.sesprn.dao.DelegaciaDao;
import br.gov.rn.pcrn.sesprn.dao.RegionalDao;
import br.gov.rn.pcrn.sesprn.dao.UsuarioDao;
import br.gov.rn.pcrn.sesprn.dominio.Regional;
import br.gov.rn.pcrn.sesprn.dominio.UsuarioLogado;
import br.gov.rn.pcrn.sesprn.negocio.EntidadeNegocio;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import java.io.IOException;

@Controller
public class RegionalController extends Controlador {

    private RegionalDao regionalDao;
    private UsuarioDao usuarioDao;
    private EntidadeNegocio entidadeNegocio;
    private Validator validator;
    private ServletContext context;

    @Inject
    UsuarioLogado usuarioLogado;

    @Inject
    private DelegaciaDao delegaciaDao;

    @Deprecated
    protected RegionalController(){
        this(null,null,null, null,null, null);
    }

    @Inject
    public RegionalController(Result resultado, RegionalDao regionalDao, UsuarioDao usuarioDao,
                              EntidadeNegocio entidadeNegocio, Validator validator, ServletContext context) {
        super(resultado);
        this.regionalDao = regionalDao;
        this.usuarioDao = usuarioDao;
        this.entidadeNegocio = entidadeNegocio;
        this.validator = validator;
        this.context = context;
    }

    public void form() {
    }

    @Post
    @Transacional
    public void salvar(Regional regional) throws IOException {

        this.regionalDao.salvar(regional);
        this.resultado.include("regionais", regionalDao.todos());
        this.resultado.redirectTo(this).lista();
    }

    public void editar(Long id) {
        Regional regional = this.regionalDao.buscarPorId(id);

        resultado.include("regional", regional);
        resultado.of(this).form();
    }

    @Transacional
    public void remover(Long id) {
        Regional regional = this.regionalDao.buscarPorId(id);
        regional.setDeletado(true);
        this.regionalDao.salvar(regional);
        this.resultado.redirectTo(this).lista();
    }

    public void lista() { this.resultado.include("regionais", this.regionalDao.listar()); }

    public void detalhar(Long id) {
        Regional regional = this.regionalDao.buscarPorId(id);
        resultado.include("regional", regional);
    }
}
