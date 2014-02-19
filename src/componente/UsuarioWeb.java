package componente;

import model.Usuario;
import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@Component
@SessionScoped
public class UsuarioWeb {
	
	private Usuario usuario;
	
	public UsuarioWeb() {
		// TODO Auto-generated constructor stub
	}
	
	public void login(Usuario usuario){
		this.usuario = usuario;
	}
	
	public void logout(){
		this.usuario = null;
	}
	
	public boolean logado(){
		if (this.usuario == null){
			return false;
		}else {
			return true;
		}
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	

}
