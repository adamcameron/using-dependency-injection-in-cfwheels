import test.BaseSpec

component extends=BaseSpec {

    function run() {
        describe("Tests for TestModel", () => {

            it("proxies method implementation to depedency", () => {
                testModel = model("Test").new()

                result = testModel.getValue()

                expect(result).toBe("SET_BY_DEPENDENCY")
            })
        })
    }
}