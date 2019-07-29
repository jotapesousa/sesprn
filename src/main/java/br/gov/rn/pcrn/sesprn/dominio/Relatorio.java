package br.gov.rn.pcrn.sesprn.dominio;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
public class Relatorio extends Entidade{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String titulo;
    private LocalDate dataAbertura;
    private int qtdeCrimes;
    private int mes;
    private int ano;
    private boolean deletado;

    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario responsavel;

    @ManyToOne(fetch = FetchType.EAGER)
    private Subcrime subcrime;

    @ManyToOne(fetch = FetchType.EAGER)
    private Delegacia delegacia;

    @ManyToOne(fetch = FetchType.EAGER)
    private Relatoriogeral relatorioGeral;


    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public LocalDate getDataAbertura() {
        return dataAbertura;
    }

    public void setDataAbertura(LocalDate dataAbertura) {
        this.dataAbertura = dataAbertura;
    }

    public int getQtdeCrimes() {
        return qtdeCrimes;
    }

    public void setQtdeCrimes(int qtdeCrimes) {
        this.qtdeCrimes = qtdeCrimes;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public boolean isDeletado() {
        return deletado;
    }

    public void setDeletado(boolean deletado) {
        this.deletado = deletado;
    }

    public Subcrime getSubcrime() {
        return subcrime;
    }

    public void setSubcrime(Subcrime subcrime) {
        this.subcrime = subcrime;
    }

    public Usuario getResponsavel() {
        return responsavel;
    }

    public void setResponsavel(Usuario responsavel) {
        this.responsavel = responsavel;
    }

    public Delegacia getDelegacia() {
        return delegacia;
    }

    public void setDelegacia(Delegacia delegacia) {
        this.delegacia = delegacia;
    }

    public Relatoriogeral getRelatorioGeral() {
        return relatorioGeral;
    }

    public void setRelatorioGeral(Relatoriogeral relatorioGeral) {
        this.relatorioGeral = relatorioGeral;
    }
}