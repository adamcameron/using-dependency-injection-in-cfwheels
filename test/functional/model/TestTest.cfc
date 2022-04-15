import test.BaseSpec

component extends=BaseSpec {

    function run() {
        describe("Tests for Test model", () => {
            it("can can be instantiated", () => {
                test = model("Test").new()

                expect(test).toBeInstanceOf("models.Test")
            })

            it("can find test records from the DB", () => {
                tests = model("Test").findAll(returnAs="object")

                expect(tests).notToBeEmpty()

                tests.each((test) => {
                    expect(test).toBeInstanceOf("models.Test")
                    expect(test.properties().keyArray().sort("text")).toBe(["id", "value"])
                })
            })

            it("has its afterInitialization handler called when it is instantiated by CFWheels", () => {
                test = model("Test").new()

                expect(test.getFindMe()).toBe("FOUND")
            })
        })
    }
}
