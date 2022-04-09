component extends=Model {

    function config() {
        super.config()
        table(name="test")
    }

    private function setDependencies() {
        variables.dependency = variables.diService.getBean("TestDependency")
        variables.logger = variables.diService.getBean("Logger")
    }

    public function getValue() {
        variables.logger.debug("getValue was called")
        return variables.dependency.getValue()
    }
}
