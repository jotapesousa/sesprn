package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Subcrime;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import java.util.List;
import java.util.stream.Collectors;

public class SubcrimeJpaDao extends EntidadeJpaDao<Subcrime> implements SubcrimeDao {

    @Deprecated
    public SubcrimeJpaDao() { this(null);}

    @Inject
    public SubcrimeJpaDao(EntityManager entityManager) {
        super(entityManager, Subcrime.class);
    }


    @Override
    public List<Subcrime> listar() {
        return super.listar().stream().collect(Collectors.toList());
    }

    @Override
    public List<Subcrime> todos() {
        return super.todos().stream().collect(Collectors.toList());
    }

    @Override
    public List<Subcrime> buscarPorCrime(Long id) {
        return manager.createQuery("SELECT s FROM Subcrime s WHERE s.crime.id = :id ORDER BY s.nome").setParameter("id", id).getResultList();
    }
}
