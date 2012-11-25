package hub

import grails.util.Environment 

class AuthFilters {
    def USERNAME = "co"
    def PASSWORD = "quepasaco"

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                /*if(!Environment.isDevelopmentMode()){
                    def authHeader = request.getHeader('Authorization')
                    if (authHeader) {
                        def usernamePassword = new String(authHeader.split(' ')[1].decodeBase64())
                        if (usernamePassword == "$USERNAME:$PASSWORD") {
                            return true
                        }
                    }
                    response.setHeader('WWW-Authenticate', 'basic realm="myRealm"')
                    response.sendError(response.SC_UNAUTHORIZED)
                    return false
                }*/
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
