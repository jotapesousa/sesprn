package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Relatorio;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import java.util.List;
import java.util.stream.Collectors;

public class RelatorioJpaDao extends EntidadeJpaDao<Relatorio> implements RelatorioDao {

    @Deprecated
    public RelatorioJpaDao() { this(null); }

    @Inject
    public RelatorioJpaDao(EntityManager entityManager) {
        super(entityManager, Relatorio.class);
    }

    @Override
    public List<Relatorio> listar() {
        return super.listar().stream().collect(Collectors.toList());
    }

    @Override
    public List<Relatorio> todos() {
        return super.todos().stream().collect(Collectors.toList());
    }
}
