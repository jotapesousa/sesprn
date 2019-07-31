package br.gov.rn.pcrn.sesprn.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.gov.rn.pcrn.sesprn.anotacoes.Transacional;
import br.gov.rn.pcrn.sesprn.dao.RelatoriogeralDao;
import br.gov.rn.pcrn.sesprn.dao.SubcrimeDao;
import br.gov.rn.pcrn.sesprn.dominio.Relatorio;
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
    public void salvar(Relatoriogeral relatoriogeral) {
        relatoriogeral.setDataAbertura(LocalDate.now());
//        relatorioGeralDao.salvar(relatoriogeral);
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

    public void detalhes(Long id) {
        Relatoriogeral relatoriogeral = relatorioGeralDao.buscarPorId(id);
        resultado.include("relatorioGeral", relatoriogeral);
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

    @Get
    public void listaRelatorios(Long id) {

        Relatoriogeral relatoriogeral = relatorioGeralDao.buscarPorId(id);
        JsonArray listaRelatorios = new JsonArray();

        if (relatoriogeral != null) {
            if (relatoriogeral.getRelatorios() != null) {
                for (Relatorio relatorio : relatoriogeral.getRelatorios()) {
                    if (!relatorio.isDeletado()) {
                        JsonObject jsonObject = new JsonObject();

                        jsonObject.addProperty("id", relatorio.getId());
                        jsonObject.addProperty("titulo", relatorio.getTitulo());
                        jsonObject.addProperty("dataAbertura", relatorio.getDataAbertura().toString());
                        jsonObject.addProperty("qtdeCrimes", relatorio.getQtdeCrimes());
                        jsonObject.addProperty("mes", relatorio.getMes());
                        jsonObject.addProperty("ano", relatorio.getAno());
                        jsonObject.addProperty("responsavelId", relatorio.getResponsavel().getId());
                        jsonObject.addProperty("responsavelNome", relatorio.getResponsavel().getNome());
                        jsonObject.addProperty("subCrimeId", relatorio.getSubcrime().getId());
                        jsonObject.addProperty("subCrimeNome", relatorio.getSubcrime().getNome());
                        jsonObject.addProperty("delegaciaId", relatorio.getDelegacia().getId());
                        jsonObject.addProperty("delegaciaNome", relatorio.getDelegacia().getNome());
                        jsonObject.addProperty("relatoriogeralId", relatorio.getRelatorioGeral().getId());
                        listaRelatorios.add(jsonObject);
                    }
                }
            }
            resultado.use(Results.json()).withoutRoot().from(listaRelatorios).recursive().serialize();
        } else {
            resultado.use(Results.json()).withoutRoot().from(listaRelatorios).recursive().serialize();
        }
    }
}
