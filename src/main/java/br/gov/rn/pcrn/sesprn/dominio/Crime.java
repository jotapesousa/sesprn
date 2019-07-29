package br.gov.rn.pcrn.sesprn.dominio;

import javax.persistence.*;
import java.util.List;

@Entity
public class Crime extends Entidade {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nome;
    private boolean deletado;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "crime")
    private List<Subcrime> subcrimes;


    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public List<Subcrime> getSubcrimes() {
        return subcrimes;
    }

    public void setSubcrimes(List<Subcrime> subcrimes) {
        this.subcrimes = subcrimes;
    }

    public boolean isDeletado() {
        return deletado;
    }

    public void setDeletado(boolean deletado) {
        this.deletado = deletado;
    }
}

