import test.BaseSpec
import services.DependencyInjectionService

component extends=BaseSpec {

    function run() {
        describe("Tests for DependencyInjectionService", () => {
            it("loads the DI/1 IoC container and its configuration", () => {
                diService = new DependencyInjectionService()

                testService = diService.getBean("DependencyInjectionService")

                expect(testService).toBeInstanceOf("services.DependencyInjectionService")
            })

            it("loads TestDependency", () => {
                diService = new DependencyInjectionService()

                testDependency = diService.getBean("TestDependency")

                expect(testDependency).toBeInstanceOf("services.TestDependency")
            })
        })
    }
}
