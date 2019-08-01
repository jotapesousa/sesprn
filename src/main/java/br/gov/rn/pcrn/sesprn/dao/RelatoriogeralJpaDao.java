package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Relatoriogeral;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.List;
import java.util.Optional;
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

    @Override
    public Relatoriogeral buscarRelatorioGeral(int mes, int ano) {
        Query query =  manager.createQuery("SELECT r FROM Relatoriogeral r WHERE r.mes = :mes AND r.ano = :ano");
        query.setParameter("mes", mes);
        query.setParameter("ano", ano);

        try {
            Relatoriogeral relatoriogeral = (Relatoriogeral) query.getSingleResult();
            return relatoriogeral;
        } catch (NoResultException e) {
            return null;
        }
    }
}
