import test.BaseSpec

component extends=BaseSpec {

    function run() {
        describe("Tests DI/1 is operational", () => {
            it("can be instantiated", () => {
                container = new framework.ioc("/services")

                expect(container).toBeInstanceOf("framework.ioc")
            })

            it("loads services with dependencies", () => {
                container = new framework.ioc("/services")

                testService = container.getBean("TestService")
                expect(testService.getDependency()).toBeInstanceOf("services.TestDependency")
            })
        })
    }

}
