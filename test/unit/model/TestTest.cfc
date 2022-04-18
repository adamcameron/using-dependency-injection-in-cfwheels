import test.BaseSpec

component extends=BaseSpec {

    function run() {
        describe("Tests for Test model", () => {
            describe("Tests of getMessage method", () => {
                it("uses an injected dependency to provide a message", () => {
                    test = model("Test").new()

                    expect(test.getMessage()).toBe("SET_BY_DEPENDENCY")
                })

                it("logs calls", () => {
                    test = model("Test").new()
                    prepareMock(test)
                    logger = test.$getProperty("logger")
                    prepareMock(logger)
                    logger.$("debug")

                    test.getMessage()

                    loggerCallLog = logger.$callLog()
                    expect(loggerCallLog).toHaveKey("debug")
                    expect(loggerCallLog.debug).toHaveLength(1)
                    expect(loggerCallLog.debug[1]).toBe(["getMessage was called"])
                })
            })
        })
    }
}
