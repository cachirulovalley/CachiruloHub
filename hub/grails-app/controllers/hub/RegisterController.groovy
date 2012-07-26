package hub

class RegisterController {
    def index() {
        [company: new Company(params)]
    }
}
