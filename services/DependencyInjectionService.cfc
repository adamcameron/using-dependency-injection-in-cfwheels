import framework.ioc

component {

    public function init() {
        variables.container = new ioc("")
        configureDependencies()
    }

    private function configureDependencies() {
        variables.container.declareBean("DependencyInjectionService", "services.DependencyInjectionService")
        variables.container.declareBean("TestDependency", "services.TestDependency")
    }

    public function onMissingMethod(required string missingMethodName, required struct missingMethodArguments) {
        return variables.container[missingMethodName](argumentCollection=missingMethodArguments)
    }
}
