package hub

import org.springframework.dao.DataIntegrityViolationException

class CompanyController {
    def geocodingService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def show(Long id) {
        def companyInstance = Company.get(id)
        if (!companyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hub.company.objectName', default: 'Company'), id])
            redirect(controller: "home")
            return
        }
        [companyInstance: companyInstance]
    }

    def edit(Long id) {
        def companyInstance = session.company //Company.get(id)
        if (!companyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hub.company.objectName', default: 'Company'), id])
            redirect(controller: "home")
            return
        }

        [companyInstance: companyInstance]
    }

    def update(Long id, Long version) {
        def companyInstance = session.company // Company.get(id)
        if (!companyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hub.company.objectName', default: 'Company'), id])
            redirect(controller: "home")
            return
        }

        if (version != null) {
            if (companyInstance.version > version) {
                companyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'hub.company.objectName', default: 'Company')] as Object[],
                          message(code: 'default.optimistic.locking.failure', args: [message(code: 'hub.company.objectName', default: 'Company')]))
                //render(view: "edit", model: [companyInstance: companyInstance])
                redirect(controller: "home")
                return
            }
        }

        bindData(companyInstance, params, [exclude: ['tags', 'logo']])

        def uploadedFile = request.getFile('logo')
        if(uploadedFile && !uploadedFile.empty){
            companyInstance.logo = uploadedFile.inputStream.bytes
        }
        

        def latLng = geocodingService.findLatLngByAddress(companyInstance.address)
        if(latLng){
            companyInstance.latitude = latLng.lat
            companyInstance.longitude = latLng.lng
        }
        companyInstance.persistTags(params.tags)

        if (!companyInstance.save(flush: true)) {
            //render(view: "edit", model: [companyInstance: companyInstance])
            redirect(controller: "home")
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'hub.company.objectName', default: 'Company'), companyInstance.id])
        //redirect(action: "show", id: companyInstance.id)
        redirect(controller: "home") 
    }

  def updatePerfil() {
	def companyInstance = session.company // Company.get(id)
        
	if (!companyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hub.company.objectName', default: 'Company'), id])
            //redirect(action: "list")
            redirect(controller: "home")
            return
        } 
	/*
        if (version != null) {
            if (companyInstance.version > version) {
                companyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'hub.company.objectName', default: 'Company')] as Object[],
                          message(code: 'default.optimistic.locking.failure', args: [message(code: 'hub.company.objectName', default: 'Company')])
                render(view: "edit", model: [companyInstance: companyInstance])
                return
            }
        }*/

	def oldPasswordCorrect = (Company.encrypt(params['oldpassword']) == companyInstance.password)
        
        if(!oldPasswordCorrect) {
	    //TODO: falla rejectValue investigar
            //companyInstance.errors.rejectValue('oldpassword', 'oldpassword.incorrect', 'Contraseña actual incorrecta')
	        companyInstance.errors.reject('hub.company.oldPassword.incorrect', 'Incorrect current password')
            //render(view: "edit", model: [companyInstance: companyInstance])
            redirect(controller: "home")
            return
        }
	//companyInstance.password = params['newpassword'] ?: companyInstance.password
	//companyInstance.email = params['email'] ?: companyInstance.email
	//companyInstance.password = params['newpassword'] ? params['newpassword'] : companyInstance.password
	//companyInstance.email = params['newemail'] ? params['newemail'] : companyInstance.email

	//if(companyInstance.isDirty('email') || companyInstance.isDirty('password')){
	//if( companyInstance.isDirty() ){
	if(!(params['email'] || params['password'] )){
	    flash.message = message(code: 'hub.company.upToDate', default: "Already up to date")
	    //render(view: "edit", model: [companyInstance: companyInstance])
        redirect(controller: "home")
	    return
	}

	//companyInstance.properties = params
	companyInstance.email = params['email'] ? params['email'] : companyInstance.email
	companyInstance.password = params['password'] ? Company.encrypt(params['password']) : companyInstance.password

	if (!companyInstance.save(flush: true)) {
	      //render(view: "edit", model: [companyInstance: companyInstance])
	      //return
	}else{
	    	flash.message = message(code: 'default.updated.message', args: [message(code: 'hub.company.profile', default: 'Company\'s profile:'), companyInstance.name])
	}
        //redirect(action: "edit", id: companyInstance.id)
        redirect(controller: "home")
    }

    def delete(){
        if (!session.company){
            flash.message = message(code: 'hub.company.not.logged', default: 'La empresa debe autenticarse')
            redirect(controller: "home")
        }
        else{
            try {
                def company = session.company
                company.delete(flush: true)
                flash.message = message(code: 'hub.company.not.logged', default: 'La empresa fue dada de baja')
                redirect(controller: "home")
            }
            catch (DataIntegrityViolationException e) {
                flash.message = message(code: 'hub.company.not.logged', default: 'No pudo darse de baja a la empresa')
                redirect(action: "show", id: id)
            }
        }
    }

    def logo(Long id) {
        def companyInstance = Company.get(id)
        if (!companyInstance || !companyInstance.logo) {
            response.status = 404;
            return
        }

        byte[] content = companyInstance.logo
        response.setContentLength(content.size())
        response.outputStream.write(content)
    }

}
