import framework.ioc

component {

    public function init() {
        variables.container = new ioc("")
        configureDependencies()
    }

    private function configureDependencies() {
        variables.container.declareBean("TestDependency", "services.TestDependency")
        variables.container.declareBean("DependencyInjectionService", "services.DependencyInjectionService")
    }

    public function onMissingMethod(required string missingMethodName, required struct missingMethodArguments) {
        return variables.container[missingMethodName](argumentCollection=missingMethodArguments)
    }
}
