package br.gov.rn.pcrn.sesprn.dominio;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity
public class Relatoriogeral extends Entidade {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String titulo;
    private int mes;
    private int ano;
    private LocalDate dataAbertura;
    private boolean deletado;

    @ManyToOne(fetch = FetchType.EAGER)
    private Delegacia delegacia;

    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario responsavel;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Relatorio> relatorios;



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

    public LocalDate getDataAbertura() {
        return dataAbertura;
    }

    public void setDataAbertura(LocalDate dataAbertura) {
        this.dataAbertura = dataAbertura;
    }

    public boolean isDeletado() {
        return deletado;
    }

    public void setDeletado(boolean deletado) {
        this.deletado = deletado;
    }

    public Delegacia getDelegacia() {
        return delegacia;
    }

    public void setDelegacia(Delegacia delegacia) {
        this.delegacia = delegacia;
    }

    public Usuario getResponsavel() {
        return responsavel;
    }

    public void setResponsavel(Usuario responsavel) {
        this.responsavel = responsavel;
    }

    public List<Relatorio> getRelatorios() {
        return relatorios;
    }

    public void setRelatorios(List<Relatorio> relatorios) {
        this.relatorios = relatorios;
    }
}
