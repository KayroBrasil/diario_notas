package interceptor;

import util.Restrito;
import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;

import componente.UsuarioWeb;

import controllers.AuthController;

@Intercepts
public class AutorizationInterceptor implements Interceptor{
	
	private UsuarioWeb usuarioWeb;
	private Result result;
	
	public AutorizationInterceptor(UsuarioWeb usuarioWeb, Result result) {
		this.usuarioWeb = usuarioWeb;
		this.result = result;
	}

	@Override
	public boolean accepts(ResourceMethod method) {
		// TODO Auto-generated method stub
		boolean intercepta = ((this.usuarioWeb.getUsuario() == null 
									&& method.containsAnnotation(Restrito.class))? 
											true : false);
		
		return intercepta;
	}

	@Override
	public void intercept(InterceptorStack stack, ResourceMethod method,
			Object obj) throws InterceptionException {
		result.redirectTo(AuthController.class).form();
		
	}
	
	
	

}
