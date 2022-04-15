<cfscript>
// Place code here that should be executed on the "onApplicationStart" event.
import services.DependencyInjectionService

setDependencyInjectionService()

private void function setDependencyInjectionService() {
    diService = new DependencyInjectionService()
    $addToCache("diService", diService)
}
</cfscript>
