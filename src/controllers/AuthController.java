package controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Usuario;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;

import componente.UsuarioWeb;

import dao.GenericJPADAO;

@Resource
public class AuthController {
	
	private GenericJPADAO dao;
	private Result result;
	private Validator validator;
	private UsuarioWeb usuarioWeb;
	
	
	public AuthController(GenericJPADAO dao, Result result, Validator validator, UsuarioWeb usuarioWeb) {
		// TODO Auto-generated constructor stub
		this.dao = dao;
		this.result = result;
		this.validator = validator;
		this.usuarioWeb = usuarioWeb;
	}
	
	public void form(){
		
	}
	
	public void home(){
		
	}
	
	public void login(Usuario usuario){
		
		Map param = new HashMap<String, String>();
		param.put("login", usuario.getLogin());
		param.put("senha", usuario.getSenha());
		
		List resultado = dao.find(Usuario.USUARIO_LOGIN, param);
		if (resultado != null){
			usuarioWeb.login((Usuario)resultado.get(0));
		}else {
			validator.add(new ValidationMessage("Usuario e/ou senha inválidos.", "usuario.login"));
		}
		
		validator.onErrorUsePageOf(this).form();
			
		result.redirectTo(AuthController.class).home();
	}
	
	public void logout(){
		
		usuarioWeb.logout();
		
		result.redirectTo(AuthController.class).form();
	}
	

	
}
