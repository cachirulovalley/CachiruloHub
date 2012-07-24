package hub

class HomeController {

    def index() {
        render(view:'index', model:[foo: params.foo, bar: 234])
    }
}
