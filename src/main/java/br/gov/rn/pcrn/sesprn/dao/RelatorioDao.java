package br.gov.rn.pcrn.sesprn.dao;

import br.gov.rn.pcrn.sesprn.dominio.Relatorio;

import java.util.List;

public interface RelatorioDao extends EntidadeDao<Relatorio> {

    @Override
    List<Relatorio> listar();

    @Override
    List<Relatorio> todos();
}
