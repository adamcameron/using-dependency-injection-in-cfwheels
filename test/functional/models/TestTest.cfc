import test.BaseSpec

component extends=BaseSpec {

    function run() {
        describe("Tests for Test model", () => {

            it("proxies method implementation to depedency", () => {
                testModel = model("Test").new()

                result = testModel.getValue()

                expect(result).toBe("SET_BY_DEPENDENCY")
            })

            it("logs calls to getValue", () => {
                testModel = model("Test").new()

                prepareMock(testModel)

                testModel.getValue()

                logger = testModel.$getProperty("logger")

                appender = logger.getAppenders().inMemoryAppender
                testLog = appender.getLog()

                expect(testLog).toHaveLength(1)
                expect(testLog[1]).toSatisfy((actual) => {
                    expect(actual.message).toBe("getValue was called")
                    expect(actual.severity).toBe(logger.logLevels.DEBUG)
                    expect(actual.timestamp).toBeCloseTo(now(), 2, "s")
                    return true
                }, "Log entry is not correct")
            })
        })
    }
}
