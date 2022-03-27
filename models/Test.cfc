component extends=Model {

    function config() {
        super.config()
        table(name="test")
    }

    public function getContainer() {
        return variables.container
    }

}
