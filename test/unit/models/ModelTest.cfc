import test.BaseSpec

component extends=BaseSpec {

    function run() {
        fdescribe("Tests Model methods", () => {
            it("is calling Model.$initModelObject ", () => {
                testModel = model("Test").new()

                expect(testModel).toBeInstanceOf("models.Test")
            })
        })
    }

}
