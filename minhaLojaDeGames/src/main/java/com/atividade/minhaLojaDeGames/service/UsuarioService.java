package com.atividade.minhaLojaDeGames.service;

import java.nio.charset.Charset;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Service;

import com.atividade.minhaLojaDeGames.model.Usuario;
import com.atividade.minhaLojaDeGames.model.UsuarioLogin;
import com.atividade.minhaLojaDeGames.repository.UsuarioRepository;

@Service
public class UsuarioService {

	@Autowired
	private UsuarioRepository usuarioRepository;
	
	/*
	 * checa se possui um usuário com o mesmo email digitado
	 * caso não tiver criará uma nova conta
	 */

	public Optional<Usuario> cadastrarUsuario(Usuario usuario) {
		if (usuarioRepository.findByUsuario(usuario.getUsuario()).isPresent())
			return Optional.empty();
		usuario.setSenha(criptografarSenha(usuario.getSenha()));
		return Optional.of(usuarioRepository.save(usuario));
	}
	
	/*
	 * checa se existe uma conta com o id e o email digitado pelo usuario
	 * se tiver a conta poderá atualizar o nome e/ou a senha do login
	 */

	public Optional<Usuario> atualizarUsuario(Usuario usuario) {
		if (usuarioRepository.findById(usuario.getId()).isPresent()) {

			Optional<Usuario> buscaUsuario = usuarioRepository.findByUsuario(usuario.getUsuario());

			if (buscaUsuario.get().getId() != usuario.getId()) {
				return Optional.empty();
			}
		}
		return Optional.empty();
	}
	
	/*
	 * checa se a senha do login é a mesma da senha do cadastro.
	 * se for verdadeiro retornará as informações do usuário e o token criado
	 */

	public Optional<UsuarioLogin> autenticarUsuario(Optional<UsuarioLogin> usuarioLogin) {
		Optional<Usuario> usuario = usuarioRepository.findByUsuario(usuarioLogin.get().getUsuario());
		if (usuario.isPresent()) {
			if (compararSenhas(usuarioLogin.get().getSenha(), usuario.get().getSenha())) {
				String token = gerarBasicToken(usuarioLogin.get().getUsuario(), usuarioLogin.get().getSenha());

				usuarioLogin.get().setId(usuario.get().getId());
				usuarioLogin.get().setNome(usuario.get().getNome());
				usuarioLogin.get().setSenha(usuario.get().getSenha());
				usuarioLogin.get().setToken(token);
				return usuarioLogin;
			}
		}

		return Optional.empty();
	}
	/*
	 * retorna a senha digitada pelo usuário encriptografada
	 */

	private String criptografarSenha(String senha) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.encode(senha);
	}

	/*
	 * checa se a senha digitada é igual a senha registrada
	 */
	
	private boolean compararSenhas(String senhaDigitada, String senhaBanco) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(senhaDigitada, senhaBanco);
	}
	
	/*
	 * cria e retorna o token para o usuário criptografado em base64
	 * exemplo: "basic ********************"
	 */

	private String gerarBasicToken(String email, String password) {
		String tokenBase = email + ":" + password;
		byte[] tokenBase64 = Base64.encodeBase64(tokenBase.getBytes(Charset.forName("US-ASCII")));
		return "Basic " + new String(tokenBase64);
	}

}
