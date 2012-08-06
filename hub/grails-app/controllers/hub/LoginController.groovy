package hub

class LoginController {

    def index() { }
	def login() {
	    
		def pass = params.pass?Company.encrypt(params.pass):''
		def company = Company.findByEmailAndPassword(params.email, pass)
		if(company){
			session.company = company
			redirect(controller:'company', action:'edit', id:company.id)
		}else{
		    render(model:[error: 'login.failed'], view: 'index')
		}
	}
}
