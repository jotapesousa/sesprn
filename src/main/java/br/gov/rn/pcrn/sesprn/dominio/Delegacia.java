package br.gov.rn.pcrn.sesprn.dominio;

import net.bytebuddy.agent.builder.AgentBuilder;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Delegacia extends Entidade{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;
    private boolean deletado;

    @ManyToOne(fetch = FetchType.EAGER)
    private Regional regional;

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public void setNome(String nome) { this.nome = nome; }

    public String getNome() { return nome; }

    public Regional getRegional() {
        return regional;
    }

    public void setRegional(Regional regional) {
        this.regional = regional;
    }

    public boolean isDeletado() {
        return deletado;
    }

    public void setDeletado(boolean deletado) {
        this.deletado = deletado;
    }

}
