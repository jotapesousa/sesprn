package br.gov.rn.pcrn.sesprn.dominio;


import br.gov.rn.pcrn.sesprn.conversor.ConvertivelOpcaoSelect;

/**
 * Created by samue on 08/09/2017.
 */
public enum TipoUsuario implements ConvertivelOpcaoSelect {
    COMUM("Comum"), ADMINISTRADOR("Administrador");

    private String chave;

    TipoUsuario(String chave) {
        this.chave = chave;
    }

    public String getChave() {
        return chave;
    }

    public String getValor() {
        return this.toString();
    }
}

