import wheels.Model

component extends=Model {

    function config() {
        table(name="test")
        afterInitialization("setFindMe")
    }

    public function setFindMe() {
        variables.findMe = "FOUND"
    }

    public string function getFindMe() {
        return variables.findMe
    }
}
