package br.gov.rn.pcrn.sesprn.negocio;

import br.gov.rn.pcrn.sesprn.dao.*;
import br.gov.rn.pcrn.sesprn.dominio.*;
import br.gov.rn.pcrn.sesprn.util.OpcaoSelect;

import javax.inject.Inject;
import java.util.List;
import java.util.stream.Collectors;

public class EntidadeNegocio {


    private RegionalDao regionalDao;
    private UsuarioDao usuarioDao;
    private DelegaciaDao delegaciaDao;
    private CrimeDao crimeDao;
    private SubcrimeDao subCrimeDao;

    @Inject
    private UsuarioLogado usuarioLogado;

    public EntidadeNegocio(){
        this(null, null, null, null, null);
    }

    @Inject
    public EntidadeNegocio(RegionalDao regionalDao, UsuarioDao usuarioDao, DelegaciaDao delegaciaDao, CrimeDao crimeDao,
                           SubcrimeDao subCrimeDao) {
        this.regionalDao = regionalDao;
        this.usuarioDao = usuarioDao;
        this.delegaciaDao = delegaciaDao;
        this.crimeDao = crimeDao;
        this.subCrimeDao = subCrimeDao;
    }

    public List<OpcaoSelect> geraListaOpcoesUsuarios() {
        List<Usuario> todos = this.usuarioDao.listar().stream().collect(Collectors.toList());
        return todos.stream().map(
                usuario -> new OpcaoSelect(usuario.getNome(), usuario.getId()))
                .collect(Collectors.toList());
    }

    public List<OpcaoSelect> geraListaOpcoesRegional() {
        List<Regional> todos = this.regionalDao.todos();
        todos.sort((a,b) ->a.getNome().compareTo(b.getNome()));
        return todos.stream().map(
                regional -> new OpcaoSelect(regional.getNome(), regional.getId()))
                .collect(Collectors.toList());
    }

    public List<OpcaoSelect> geraListaOpcoesDelegacia() {
        List<Delegacia> todos = this.delegaciaDao.listar();
        todos.sort((a,b) ->a.getNome().compareTo(b.getNome()));
        return todos.stream().map(
                delegacia -> new OpcaoSelect(delegacia.getNome(), delegacia.getId()))
                .collect(Collectors.toList());
    }

    public List<OpcaoSelect> geraListaOpcoesCrime() {
        List<Crime> todos = this.crimeDao.listar();
        todos.sort((a,b) ->a.getNome().compareTo(b.getNome()));
        return todos.stream().map(
                crime -> new OpcaoSelect(crime.getNome(), crime.getId()))
                .collect(Collectors.toList());
    }

    public List<OpcaoSelect> geraListaOpcoesSubCrime() {
        List<Subcrime> todos = this.subCrimeDao.listar();
        todos.sort((a,b) ->a.getNome().compareTo(b.getNome()));
        return todos.stream().map(
                subCrime -> new OpcaoSelect(subCrime.getNome(), subCrime.getId()))
                .collect(Collectors.toList());
    }


}
