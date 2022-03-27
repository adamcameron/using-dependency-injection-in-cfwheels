import test.BaseSpec
import services.DependencyInjectionService

component extends=BaseSpec {

    function run() {
        describe("Tests for DependencyInjectionService", () => {
            it("loads the IoC container", () => {
                diService = new DependencyInjectionService()

                testService = diService.getBean("DependencyInjectionService")

                expect(testService).toBeInstanceOf("services.DependencyInjectionService")
            })
        });
    }
}
