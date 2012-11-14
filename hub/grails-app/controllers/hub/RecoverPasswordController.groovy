package hub

class RecoverPasswordController {

	def mailService
	
    def index() { }
	
	def recoverPassword() {
		def company = Company.findByEmail(params.email)
		if(company) {
			def passwd = randomPassword()
			company.password = passwd
			company.encrypt()
			company.save(flush:true)
			mailService.sendMail {
				to company.email
				subject "[CachiruloHub] "+message(code: 'hub.recoverPassword.subject', default:'New Password')
				html g.render(template:"/mails/newPassword", model:[password: passwd])
			  }
			flash.message = message(code:"hub.recoverPassword.sent", default:"A new password was generated and emailed")
			redirect(controller:'login', action:'index')
			return
		}
		flash.message = message(code:"hub.recoverPassword.not.registered", default:"The company is not registered")
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
