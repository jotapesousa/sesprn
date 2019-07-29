package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Relatoriogeral;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import java.util.List;
import java.util.stream.Collectors;

public class RelatoriogeralJpaDao extends EntidadeJpaDao<Relatoriogeral> implements RelatoriogeralDao {

    @Deprecated
    public RelatoriogeralJpaDao() { this(null); }

    @Inject
    public RelatoriogeralJpaDao(EntityManager entityManager) {
        super(entityManager, Relatoriogeral.class);
    }

    @Override
    public List<Relatoriogeral> listar() {
        return super.listar().stream().collect(Collectors.toList());
    }

    @Override
    public List<Relatoriogeral> todos() {
        return super.todos().stream().collect(Collectors.toList());
    }
}
