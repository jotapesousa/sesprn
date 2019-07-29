package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Crime;

import java.util.List;

public interface CrimeDao extends EntidadeDao<Crime> {
    @Override
    List<Crime> listar();

    @Override
    List<Crime> todos();
}
