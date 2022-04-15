import test.BaseSpec
import services.TestDependency

component extends=BaseSpec {

    function run() {
        describe("Tests for TestDependency", () => {
            describe("Tests for getMessage method", () => {
                it("returns SET_BY_DEPENDENCY", () => {
                    testDependency = new TestDependency()

                    expect(testDependency.getMessage()).toBe("SET_BY_DEPENDENCY")
                })
            })
        })
    }
}
