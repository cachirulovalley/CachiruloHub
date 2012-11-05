package hub

class RegisterController {
    def mailService
    
    def index() {
        [company: new Company(params)]
    }
    
    def save() {
        def company = new Company(params)
        
        def samePasswords = (params['password'] == params['repassword'])
        
        if(!samePasswords) {
            company.errors.rejectValue('password', 'password.doesnotmatch', 'Passwords don\'t match')
            render(model: [company: company], view: 'index')
            return
        }
        if(!company.save(flush:true)){
            render(model: [company: company], view: 'index')
            return 
        }
        
        mailService.sendMail {     
          to company.email
          subject "[CachiruloHub] Confirma tu email"
          html g.render(template:"/mails/confirmation", model:[company: company])
        }
        flash.message = "Hemos mandado un email a ${company.email} para confirmar el registro"
        redirect(controller:'home')
    }
    
    def confirm() {
        def company = Company.findByKey(params.id)
        if(company){
            company.enabled = true
            company.save()
            redirect(controller:'company', action:'edit', id: company.id)
        }
    }
}
