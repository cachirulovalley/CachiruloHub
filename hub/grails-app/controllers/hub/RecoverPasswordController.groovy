package hub

class RecoverPasswordController {

	def mailService
	
    def index() { }
	
	def recoverPassword() {
		def company = Company.findByEmail(params.email)
		if(company) {
			def passwd = randomPassword()
			// activar al descomentar beforeUpdate en Commit
			// company.password = passwd
			company.password = company.encrypt(passwd)			
			company.save(flush:true)
			mailService.sendMail {
				to company.email
				subject "[CachiruloHub] Nueva clave"
				html g.render(template:"/mails/newPassword", model:[password: passwd])
			  }
			flash.message = "Nueva clave generada y enviada por correo"
			redirect(controller:'home', action:'index')
			return
		}
		flash.message = "Empresa no registrada"
		redirect(controller: 'recoverPassword', action:'index')
		  
	}
	
	// snippet taken from:
	// http://www.codecodex.com/wiki/Generate_a_random_password_or_random_string#Groovy
	def randomPassword() {
		def pool = ['a'..'z','A'..'Z',0..9,'_'].flatten()
		Random rand = new Random(System.currentTimeMillis())
		
		def passChars = (0..10).collect { pool[rand.nextInt(pool.size())] }
		def password = passChars.join()
	}
}
