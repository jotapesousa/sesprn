package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Usuario;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;
import java.util.Optional;

public class UsuarioJpaDao extends EntidadeJpaDao<Usuario> implements UsuarioDao {

    /**
     * @deprecated CDI
     */
    @Deprecated
    public UsuarioJpaDao() {
        this(null);
    }

    @Inject
    public UsuarioJpaDao(EntityManager entityManager) {
        super(entityManager, Usuario.class);
    }

    @Override
    public Optional<Usuario> buscarPorLogin(String login) {
        Query query = this.manager.createQuery("SELECT p from Usuario p where p.login = :login");
        query.setParameter("login",login);
        return query.setMaxResults(1).getResultList().stream().findFirst();
    }

    @Override
    public List<Usuario> listarAptos() {
        Query query = this.manager.createQuery("SELECT u FROM Usuario u WHERE u.id <> 1 AND u.deletado = false");
        return query.getResultList();
    }
}
