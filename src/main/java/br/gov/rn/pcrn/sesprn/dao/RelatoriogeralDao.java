package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Relatoriogeral;

import java.util.List;

public interface RelatoriogeralDao extends EntidadeDao<Relatoriogeral> {

    @Override
    List<Relatoriogeral> listar();

    @Override
    List<Relatoriogeral> todos();


}
