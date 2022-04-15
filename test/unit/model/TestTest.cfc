import test.BaseSpec

component extends=BaseSpec {

    function run() {
        describe("Tests for Test model", () => {
            describe("Tests of getMessage method", () => {
                it("uses an injected dependency to provide a message", () => {
                    test = model("Test").new()

                    expect(test.getMessage()).toBe("SET_BY_DEPENDENCY")
                })
            })
        })
    }
}
