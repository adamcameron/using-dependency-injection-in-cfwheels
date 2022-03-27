/**
 * This is the parent model file that all your models should extend.
 * You can add functions to this file to make them available in all your models.
 * Do not delete this file.
 */

import services.DependencyInjectionService

component extends=wheels.Model {

    public function config() {
        afterInitialization("loadIocContainer")
    }

    private function loadIocContainer() {
        variables.diService = new DependencyInjectionService()
        setDependencies()
    }

    public function getDiService() {
        return variables.diService
    }

    private function setDependencies() {
    }
}
