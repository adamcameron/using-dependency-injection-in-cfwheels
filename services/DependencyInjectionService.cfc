import framework.ioc
import logbox.system.logging.config.LogBoxConfig
import logbox.system.logging.LogBox
import services.logging.Config

component {

    public function init() {
        variables.container = new ioc("")
        configureDependencies()
    }

    private function configureDependencies() {
        variables.container.declareBean("DependencyInjectionService", "services.DependencyInjectionService")
        variables.container.declareBean("TestDependency", "services.TestDependency")

        variables.container.factoryBean("Logger", () => {
            config = new Config()
            logboxConfig = new LogBoxConfig(config)

            logbox = new LogBox(logboxConfig)
            logger = logbox.getRootLogger()

            return logger
        })
    }

    public function onMissingMethod(required string missingMethodName, required struct missingMethodArguments) {
        return variables.container[missingMethodName](argumentCollection=missingMethodArguments)
    }
}
