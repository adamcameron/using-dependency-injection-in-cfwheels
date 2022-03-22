component {

    public function init(TestDependency testDependency) {
        variables.dependency = arguments.testDependency
    }

    public function getDependency() {
        return variables.dependency
    }
}
