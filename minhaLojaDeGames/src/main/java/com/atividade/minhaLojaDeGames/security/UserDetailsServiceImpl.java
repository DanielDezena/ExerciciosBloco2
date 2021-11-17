package com.atividade.minhaLojaDeGames.security;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.atividade.minhaLojaDeGames.model.Usuario;
import com.atividade.minhaLojaDeGames.repository.UsuarioRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{
	@Autowired
	private UsuarioRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		Optional<Usuario> usuario = userRepository.findByUsuario(username);
		usuario.orElseThrow(() -> new UsernameNotFoundException(username + " não encontrado :/"));
		
		
		// TODO Auto-generated method stub
		return usuario.map(UserDetailsImpl::new).get();
	}

}
