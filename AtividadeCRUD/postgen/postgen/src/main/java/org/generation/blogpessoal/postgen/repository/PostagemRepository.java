package org.generation.blogpessoal.postgen.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import org.generation.blogpessoal.postgen.model.Postagem;

	
	@Repository
	public interface PostagemRepository extends JpaRepository<Postagem, Long>{
		
	}


