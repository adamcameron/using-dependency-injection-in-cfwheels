/**
 * This is the parent model file that all your models should extend.
 * You can add functions to this file to make them available in all your models.
 * Do not delete this file.
 */

component extends=wheels.Model {

    function config() {
        afterInitialization("loadIocContainer")
    }

    private function loadIocContainer() {
        variables.diService = $getFromCache("diService")
        setDependencies()
    }

    private function setDependencies() {
        // OVERRIDE IN SUBCLASS
    }
}
