package hub

class RegisterController {
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
        redirect(controller:'company', action:'edit', id: company.id)
    }
}
