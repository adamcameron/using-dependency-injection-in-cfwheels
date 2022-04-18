import wheels.Model

component extends=Model {

    function config() {
        super.config()
        table(name="test")
        afterInitialization("setFindMe")
    }

    public function setFindMe() {
        variables.findMe = "FOUND"
    }

    public string function getFindMe() {
        return variables.findMe
    }

    private function setDependencies() {
        variables.dependency = variables.diService.getBean("TestDependency")
        variables.logger = variables.diService.getBean("Logger")
    }

    public function getMessage() {
        variables.logger.debug("getMessage was called")
        return variables.dependency.getMessage()
    }

}
