import test.BaseSpec

component extends=BaseSpec {

    function run() {
        describe("Tests Model methods", () => {
            it("calls the afterInitialization handler when new is called", () => {
                testModel = model("Test").new()

                expect(() => testModel.getDiService()).notToThrow()
            })

            it("calls the afterInitialization handler when findOne is called", () => {
                testModel = model("Test").findOne()

                expect(() => testModel.getDiService()).notToThrow()
            })

            it("calls the afterInitialization handler when findAll is called", () => {
                testModels = model("Test").findAll(returnAs="objects")

                expect(testModels).notToBeEmpty()
                testModels.each((testModel) => {
                    expect(() => testModel.getDiService()).notToThrow()
                })
            })
        })
    }

}
