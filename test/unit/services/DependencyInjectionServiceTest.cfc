import test.BaseSpec
import services.DependencyInjectionService

component extends=BaseSpec {

    function run() {
        describe("Tests for DependencyInjectionService", () => {
            it("loads the DI/1 IoC container", () => {
                diService = new DependencyInjectionService()

                testService = diService.getBean("DependencyInjectionService")

                expect(testService).toBeInstanceOf("services.DependencyInjectionService")
            })

            it("configures the logger service", () => {
                diService = new DependencyInjectionService()

                logger = diService.getBean("Logger")

                expect(logger).toBeInstanceOf("logbox.system.logging.Logger")
            })
        });
    }
}
