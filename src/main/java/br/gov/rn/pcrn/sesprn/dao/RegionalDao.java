package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Delegacia;
import br.gov.rn.pcrn.sesprn.dominio.Regional;

import java.util.List;

public interface RegionalDao extends EntidadeDao<Regional> {

    @Override
    List<Regional> listar();

    @Override
    List<Regional> todos();
}
