package br.gov.rn.pcrn.sesprn.anotacoes;

import br.gov.rn.pcrn.sesprn.dominio.TipoUsuario;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME) @Target({ElementType.TYPE, ElementType.METHOD})
public @interface Seguranca {
    TipoUsuario tipoUsuario() default TipoUsuario.COMUM;

}
