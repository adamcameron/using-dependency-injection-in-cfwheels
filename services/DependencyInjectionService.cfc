import framework.ioc

component {

    public function init() {
        variables.container = new ioc("/services")
    }

    public function onMissingMethod(required string missingMethodName, required struct missingMethodArguments) {
        return variables.container[missingMethodName](argumentCollection=missingMethodArguments)
    }
}
