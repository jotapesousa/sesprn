package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Crime;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import java.util.List;
import java.util.stream.Collectors;

public class CrimeJpaDao extends EntidadeJpaDao<Crime> implements CrimeDao{
    /**
     * @deprecated CDI
     */
    @Deprecated
    public CrimeJpaDao(){
        this(null);
    }

    @Inject
    public CrimeJpaDao(EntityManager entityManager){
        super(entityManager,Crime.class);
    }

    @Override
    public List<Crime> listar(){
        return super.listar().stream().collect(Collectors.toList());
    }

    @Override
    public List<Crime> todos(){
        return super.todos().stream().collect(Collectors.toList());
    }
}
