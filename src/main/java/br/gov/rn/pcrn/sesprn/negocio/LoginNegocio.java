package br.gov.rn.pcrn.sesprn.negocio;

import br.gov.rn.pcrn.sesprn.anotacoes.Transacional;
import br.gov.rn.pcrn.sesprn.dao.UsuarioDao;
import br.gov.rn.pcrn.sesprn.dominio.TipoUsuario;
import br.gov.rn.pcrn.sesprn.dominio.Usuario;
import br.gov.rn.pcrn.sesprn.util.Criptografia;
import sun.rmi.runtime.Log;

import javax.inject.Inject;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.ldap.Control;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;
import java.io.IOException;
import java.net.UnknownHostException;
import java.time.LocalDateTime;
import java.util.Hashtable;
import java.util.Optional;

public class LoginNegocio {

    private UsuarioDao usuarioDao;

    public LoginNegocio() { this(null); }

    @Inject
    public LoginNegocio(UsuarioDao usuarioDao) {
        this.usuarioDao = usuarioDao;
    }

    public boolean validarUsuario(Usuario usuario) {
        if(usuario != null) {
            Optional<Usuario> usuarioBanco = usuarioDao.buscarPorLogin(usuario.getLogin());
            if (usuarioBanco.isPresent()) {
                return true;
            } else {

            }
        }
        return false;
    }

    @Transacional
    public Usuario buscarUsuario(Usuario usuario) {
        if(usuario != null) {
            Optional<Usuario> usuarioBanco = usuarioDao.buscarPorLogin(usuario.getLogin());
            if (usuarioBanco.isPresent()) {
                return usuarioBanco.get();
            } else {
                usuario.setNome(usuario.getLogin());
                usuario.setTipoUsuario(TipoUsuario.COMUM);
                usuario.setDeletado(false);
                usuario.setDataCadastro(LocalDateTime.now());
                usuario.setPermissao(false);
                usuario.setSenha("");
                usuarioDao.salvar(usuario);
            }
        }
        return usuario;
    }

    public Usuario ldapAuth(Usuario usuario) throws NamingException, UnknownHostException, IOException {

        Hashtable<String, String> env;
        LdapContext ctx;
        Control[] connectionControls;

        env = new Hashtable<String, String>();
        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
        env.put(Context.PROVIDER_URL, "ldap://10.9.0.4:389");
        env.put(Context.SECURITY_AUTHENTICATION, "simple");
//        env.put(Context.SECURITY_PRINCIPAL, "CN=SEI TESTE,CN=Users,OU=CONTAS NOVAS,DC=pcrn,DC=local");
//        env.put(Context.SECURITY_CREDENTIALS, "pcrn@2018");
        env.put(Context.SECURITY_PRINCIPAL, usuario.getLogin() + "@pcrn.local");
        env.put(Context.SECURITY_CREDENTIALS, usuario.getSenha());
        ctx = null;

        if (usuario != null) {
            if (usuario.getLogin().equals("")) {
                // INFORMAR CPF EM BRANCO
                System.out.println("USUARIO EM BRANCO");
            }

            ctx = null;
            try {
                // CONEXAO SENDO FEITA
                connectionControls = null;
                ctx = new InitialLdapContext(env, connectionControls);

                return buscarUsuario(usuario);

            } catch (NamingException e) {
                e.printStackTrace();
                System.out.println("USUÁRIO NÃO CADASTRADO!");
                return null;
            } finally {
                if (ctx != null) {
                    try {
                        ctx.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return null;
    }
}

