package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Relatoriogeral;

import java.util.List;
import java.util.Optional;

public interface RelatoriogeralDao extends EntidadeDao<Relatoriogeral> {

    @Override
    List<Relatoriogeral> listar();

    @Override
    List<Relatoriogeral> todos();
    Relatoriogeral buscarRelatorioGeral(int mes, int ano);


}
