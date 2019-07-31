package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Delegacia;
import br.gov.rn.pcrn.sesprn.dominio.Usuario;

import java.util.List;

public interface DelegaciaDao extends EntidadeDao<Delegacia> {
    @Override
    List<Delegacia> listar();

    @Override
    List<Delegacia> todos();

    List<Usuario> buscarUsuariosPorDelegacia(Long id);
}