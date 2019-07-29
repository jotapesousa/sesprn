package br.gov.rn.pcrn.sesprn.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.gov.rn.pcrn.sesprn.anotacoes.Transacional;
import br.gov.rn.pcrn.sesprn.dao.SubcrimeDao;
import br.gov.rn.pcrn.sesprn.dominio.Subcrime;
import br.gov.rn.pcrn.sesprn.negocio.EntidadeNegocio;

import javax.inject.Inject;

@Controller
public class SubcrimesController extends Controlador{

    private SubcrimeDao subcrimeDao;
    private EntidadeNegocio entidadeNegocio;
    private Validator validator;

    @Deprecated
    public SubcrimesController(){
        this(null,null, null, null);
    }

    @Inject
    public SubcrimesController(Result resultado, SubcrimeDao subcrimeDao, EntidadeNegocio entidadeNegocio, Validator validator) {
        super(resultado);
        this.subcrimeDao = subcrimeDao;
        this.entidadeNegocio = entidadeNegocio;
        this.validator = validator;
    }

    public void form(){
        resultado.include("crimes", entidadeNegocio.geraListaOpcoesCrime());
    }

    @Post
    @Transacional
    public void salvar(Subcrime subcrime){
        validator.onErrorRedirectTo(this).form();

        this.subcrimeDao.salvar(subcrime);
        resultado.redirectTo(this).lista();
    }

    public void editar(Long id){
        Subcrime subcrime = subcrimeDao.buscarPorId(id);
        this.subcrimeDao.salvar(subcrime);
        resultado.of(this).form();
    }

    public void lista(){
        resultado.include("subcrimes", subcrimeDao.listar());
        resultado.include("crimes", entidadeNegocio.geraListaOpcoesCrime());
    }

    @Transacional
    public void remover(Long id) {
        Subcrime subcrime = subcrimeDao.buscarPorId(id);
        subcrime.setDeletado(true);
        this.subcrimeDao.salvar(subcrime);
        resultado.redirectTo(this).lista();
    }

    @Get
    public void detalhes(Long id) {
        Subcrime subcrime = this.subcrimeDao.buscarPorId(id);
        this.resultado.include("subcrime", subcrime);
    }
}
