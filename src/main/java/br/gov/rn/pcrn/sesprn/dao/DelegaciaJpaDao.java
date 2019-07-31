package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Delegacia;
import br.gov.rn.pcrn.sesprn.dominio.Usuario;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;
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

    @Override
    public List<Usuario> buscarUsuariosPorDelegacia(Long id) {
        return manager.createQuery("SELECT u FROM Usuario u WHERE delegacia_id = :idDelegacia").setParameter("idDelegacia", id).getResultList();
    }
}

