package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Delegacia;
import br.gov.rn.pcrn.sesprn.dominio.Regional;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import java.util.List;
import java.util.stream.Collectors;

public class RegionalJpaDao extends EntidadeJpaDao<Regional> implements RegionalDao  {

    @Deprecated
    public RegionalJpaDao() { this(null); }

    @Inject
    public RegionalJpaDao(EntityManager entityManager) {
        super(entityManager, Regional.class);
    }


    @Override
    public List<Regional> listar() {
        return super.listar().stream().collect(Collectors.toList());
    }

    @Override
    public List<Regional> todos() {
        return super.todos().stream().collect(Collectors.toList());
    }
}
