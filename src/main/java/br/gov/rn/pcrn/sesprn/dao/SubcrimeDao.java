package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Subcrime;

import java.util.List;

public interface SubcrimeDao extends EntidadeDao<Subcrime> {

    @Override
    List<Subcrime> listar();

    @Override
    List<Subcrime> todos();

    List<Subcrime> buscarPorCrime(Long id);
}


