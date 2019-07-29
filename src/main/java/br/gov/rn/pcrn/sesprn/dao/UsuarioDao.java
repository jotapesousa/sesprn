package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Usuario;

import java.util.List;
import java.util.Optional;

public interface UsuarioDao extends EntidadeDao<Usuario> {

    Optional<Usuario> buscarPorLogin(String login);
    List<Usuario> listarAptos();
}
