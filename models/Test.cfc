component extends=Model {

    function config() {
        super.config()
        table(name="test")
    }

    private function setDependencies() {
        variables.dependency = variables.diService.getBean("TestDependency")
    }

    public function getValue() {
        return variables.dependency.getValue()
    }
}
