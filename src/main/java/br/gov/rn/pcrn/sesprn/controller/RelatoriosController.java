package br.gov.rn.pcrn.sesprn.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.gov.rn.pcrn.sesprn.anotacoes.Transacional;
import br.gov.rn.pcrn.sesprn.dao.RelatorioDao;
import br.gov.rn.pcrn.sesprn.dao.SubcrimeDao;
import br.gov.rn.pcrn.sesprn.dominio.Relatorio;
import br.gov.rn.pcrn.sesprn.dominio.Subcrime;
import br.gov.rn.pcrn.sesprn.negocio.EntidadeNegocio;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import javax.inject.Inject;
import java.time.LocalDate;
import java.util.List;

@Controller
public class RelatoriosController extends Controlador{

    private RelatorioDao relatorioDao;
    private EntidadeNegocio entidadeNegocio;
    private SubcrimeDao subcrimeDao;

    @Deprecated
    public RelatoriosController() { this(null, null, null, null); }

    @Inject
    public RelatoriosController(Result resultado, RelatorioDao relatorioDao, EntidadeNegocio entidadeNegocio, SubcrimeDao subcrimeDao) {
        super(resultado);
        this.relatorioDao = relatorioDao;
        this.entidadeNegocio = entidadeNegocio;
        this.subcrimeDao = subcrimeDao;
    }

    public void form() {
        resultado.include("delegacias", entidadeNegocio.geraListaOpcoesDelegacia());
        resultado.include("crimes", entidadeNegocio.geraListaOpcoesCrime());
    }

    public void lista() {
        resultado.include("relatorios", relatorioDao.listar());
    }

    @Post
    @Transacional
    public void salvar(Relatorio relatorio) {
        relatorio.setDataAbertura(LocalDate.now());
//        relatorio.setResponsavel(usuarioLogado.getUsuario());
        relatorioDao.salvar(relatorio);
        resultado.redirectTo(this).lista();
    }

    public void editar(Long id) {
       Relatorio relatorio = relatorioDao.buscarPorId(id);
    }

    @Transacional
    public void remover(Long id) {
        Relatorio relatorio = relatorioDao.buscarPorId(id);
        relatorio.setDeletado(true);
        relatorioDao.salvar(relatorio);
        resultado.redirectTo(this).lista();
    }

    @Get
    public void buscarSubCrimes(Long id) {
        List<Subcrime> subcrimes = subcrimeDao.buscarPorCrime(id);

        JsonArray jsonArray = new JsonArray();
        for (Subcrime subcrime : subcrimes) {
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("id", subcrime.getId());
            jsonObject.addProperty("nome", subcrime.getNome());
            jsonArray.add(jsonObject);
        }
        resultado.use(Results.json()).withoutRoot().from(jsonArray).recursive().serialize();
    }

}
