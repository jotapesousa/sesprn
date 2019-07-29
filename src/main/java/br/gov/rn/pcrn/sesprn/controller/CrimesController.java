package br.gov.rn.pcrn.sesprn.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.gov.rn.pcrn.sesprn.anotacoes.Transacional;
import br.gov.rn.pcrn.sesprn.dao.CrimeDao;
import br.gov.rn.pcrn.sesprn.dominio.Crime;

import javax.inject.Inject;

@Controller
public class CrimesController extends Controlador {

    private CrimeDao crimeDao;

    @Deprecated
    public CrimesController(){
        this(null,null);
    }

    @Inject
    public CrimesController(Result resultado, CrimeDao crimeDao) {
        super(resultado);
        this.crimeDao = crimeDao;
    }

    public void lista(){
        resultado.include("crimes", crimeDao.listar());
    }

    public void form(){}

    @Post("/crimes")
    @Transacional
    public void salvar(Crime crime){
        this.crimeDao.salvar(crime);
        resultado.redirectTo(this).lista();
    }

    public void editar(Long id){
        Crime crime = crimeDao.buscarPorId(id);
        this.crimeDao.salvar(crime);
        resultado.of(this).form();
    }

    @Transacional
    public void remover(Long id) {
        Crime crime = crimeDao.buscarPorId(id);
        crime.setDeletado(true);
        this.crimeDao.salvar(crime);
        resultado.redirectTo(this).lista();
    }

    @Get
    public void detalhes(Long id) {
        Crime crime = this.crimeDao.buscarPorId(id);
        this.resultado.include("crime", crime);
    }
}
