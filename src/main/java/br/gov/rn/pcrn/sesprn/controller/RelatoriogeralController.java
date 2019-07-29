package br.gov.rn.pcrn.sesprn.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.gov.rn.pcrn.sesprn.anotacoes.Transacional;
import br.gov.rn.pcrn.sesprn.dao.RelatoriogeralDao;
import br.gov.rn.pcrn.sesprn.dao.SubcrimeDao;
import br.gov.rn.pcrn.sesprn.dominio.Relatoriogeral;
import br.gov.rn.pcrn.sesprn.dominio.Subcrime;
import br.gov.rn.pcrn.sesprn.negocio.EntidadeNegocio;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import javax.inject.Inject;
import java.time.LocalDate;
import java.util.List;

@Controller
public class RelatoriogeralController extends Controlador {

    private RelatoriogeralDao relatorioGeralDao;
    private SubcrimeDao subcrimeDao;
    private EntidadeNegocio entidadeNegocio;

    public RelatoriogeralController() { this(null, null, null, null); }

    @Inject
    public RelatoriogeralController(Result resultado, RelatoriogeralDao relatorioGeralDao, SubcrimeDao subcrimeDao, EntidadeNegocio entidadeNegocio) {
        super(resultado);
        this.relatorioGeralDao = relatorioGeralDao;
        this.subcrimeDao = subcrimeDao;
        this.entidadeNegocio = entidadeNegocio;
    }

    public void form() {
        resultado.include("delegacias", entidadeNegocio.geraListaOpcoesDelegacia());
        resultado.include("crimes", entidadeNegocio.geraListaOpcoesCrime());
    }

    @Post
    @Transacional
    public void salvar(Relatoriogeral relatorioGeral) {
        relatorioGeral.setDataAbertura(LocalDate.now());
        relatorioGeralDao.salvar(relatorioGeral);
        resultado.redirectTo(this).lista();
    }

    @Get
    public void lista() {
        resultado.include("relatoriosGerais", relatorioGeralDao.listar());
    }

    public void editar(Long id) {
        Relatoriogeral relatorioGeral = relatorioGeralDao.buscarPorId(id);
        resultado.include("relatorioGeral", relatorioGeral);
        resultado.of(this).form();
    }

    @Transacional
    public void remover(Long id) {
        Relatoriogeral relatorioGeral = relatorioGeralDao.buscarPorId(id);
        relatorioGeral.setDeletado(true);
        relatorioGeralDao.salvar(relatorioGeral);
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
