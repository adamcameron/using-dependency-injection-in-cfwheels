component {

    public function init(required TestDependency testDependency) {
        variables.dependency = arguments.testDependency
    }

    public TestDependency function getDependency() {
        return variables.dependency
    }
}
