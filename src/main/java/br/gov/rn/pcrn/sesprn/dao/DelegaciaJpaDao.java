package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Delegacia;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import java.util.List;
import java.util.stream.Collectors;

public class DelegaciaJpaDao extends EntidadeJpaDao<Delegacia> implements DelegaciaDao{
    /**
     * @deprecated CDI
     */
    @Deprecated
    public DelegaciaJpaDao() {
        this(null);
    }

    @Inject
    public DelegaciaJpaDao(EntityManager entityManager) {
        super(entityManager, Delegacia.class);
    }

    @Override
    public List<Delegacia> listar() {
        return super.listar().stream().collect(Collectors.toList());
    }

    @Override
    public List<Delegacia> todos() {
        return super.todos().stream().collect(Collectors.toList());
    }
}

