import test.BaseSpec

component extends=BaseSpec {

    function run() {
        describe("Tests for TestModel", () => {

            it("loads its depenency", () => {
                testModel = model("Test").new()

                diService = testModel.getDiService()

                expect(diService).toBeInstanceOf("services.DependencyInjectionService")
            })
        })
    }

}
