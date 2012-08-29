package hub

import org.springframework.dao.DataIntegrityViolationException

class CompanyController {
    def geocodingService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [companyInstanceList: Company.list(params), companyInstanceTotal: Company.count()]
    }

    def create() {
        [companyInstance: new Company(params)]
    }

    def save() {
        def companyInstance = new Company(params)
        if (!companyInstance.save(flush: true)) {
            render(view: "create", model: [companyInstance: companyInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'company.label', default: 'Company'), companyInstance.id])
        redirect(action: "show", id: companyInstance.id)
    }

    def show(Long id) {
        def companyInstance = Company.get(id)
        if (!companyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), id])
            redirect(action: "list")
            return
        }
        [companyInstance: companyInstance]
    }

    def edit(Long id) {
        def companyInstance = session.company //Company.get(id)
        if (!companyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), id])
            redirect(action: "list")
            return
        }

        [companyInstance: companyInstance]
    }

    def update(Long id, Long version) {
        def companyInstance = session.company // Company.get(id)
        if (!companyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (companyInstance.version > version) {
                companyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'company.label', default: 'Company')] as Object[],
                          "Another user has updated this Company while you were editing")
                render(view: "edit", model: [companyInstance: companyInstance])
                return
            }
        }

        companyInstance.properties = params
        
        def latLng = geocodingService.findLatLngByAddress(companyInstance.address)
        if(latLng){
            companyInstance.latitude = latLng.lat
            companyInstance.longitude = latLng.lng
        }
        

        if (!companyInstance.save(flush: true)) {
            render(view: "edit", model: [companyInstance: companyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'company.label', default: 'Company'), companyInstance.id])
        redirect(action: "show", id: companyInstance.id)
    }

    def delete(Long id) {
        def companyInstance = Company.get(id)
        if (!companyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), id])
            redirect(action: "list")
            return
        }

        try {
            companyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'company.label', default: 'Company'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'company.label', default: 'Company'), id])
            redirect(action: "show", id: id)
        }
    }

  def updatePerfil() {
	def companyInstance = session.company // Company.get(id)
        
	if (!companyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), id])
            redirect(action: "list")
            return
        } 
	/*
        if (version != null) {
            if (companyInstance.version > version) {
                companyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'company.label', default: 'Company')] as Object[],
                          "Another user has updated this Company while you were editing")
                render(view: "edit", model: [companyInstance: companyInstance])
                return
            }
        }*/

	def oldPasswordCorrect = (Company.encrypt(params['oldpassword']) == companyInstance.password)
        
        if(!oldPasswordCorrect) {
	    //TODO: falla rejectValue investigar
            //companyInstance.errors.rejectValue('oldpassword', 'oldpassword.incorrect', 'Contraseña actual incorrecta')
	    companyInstance.errors.reject('oldpassword.incorrect', 'Contraseña actual incorrecta')
	    render(view: "edit", model: [companyInstance: companyInstance])
            return
        }
	//companyInstance.password = params['newpassword'] ?: companyInstance.password
	//companyInstance.email = params['email'] ?: companyInstance.email
	//companyInstance.password = params['newpassword'] ? params['newpassword'] : companyInstance.password
	//companyInstance.email = params['newemail'] ? params['newemail'] : companyInstance.email

	//if(companyInstance.isDirty('email') || companyInstance.isDirty('password')){
	//if( companyInstance.isDirty() ){
	if(!(params['email'] || params['password'] )){
	    flash.message = message(code: 'default.noupdated.message', default: "Nada que actualizar")
	    render(view: "edit", model: [companyInstance: companyInstance])          
	    return
	}

	//companyInstance.properties = params
	companyInstance.email = params['email'] ? params['email'] : companyInstance.email
	companyInstance.password = params['password'] ? Company.encrypt(params['password']) : companyInstance.password

	if (!companyInstance.save(flush: true)) {
	      //render(view: "edit", model: [companyInstance: companyInstance])
	      //return
	}else{
	    	flash.message = message(code: 'default.updated.message', args: [message(code: 'perfil.label', default: 'Perfil'), ''])
	}

        render(view: "edit", model: [companyInstance: companyInstance])          
    }
}
