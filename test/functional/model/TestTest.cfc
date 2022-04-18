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

            it("logs via the correct appender", () => {
                test = model("Test").new()

                prepareMock(test)
                logger = test.$getProperty("logger")

                appenders = logger.getAppenders()
                expect(appenders).toHaveKey("DummyAppender", "Logger is not configured with the correct appender. Test aborted.")

                appender = logger.getAppenders().DummyAppender
                prepareMock(appender)
                appender.$("logMessage").$results(appender)

                test.getMessage()

                appenderCallLog = appender.$callLog()

                expect(appenderCallLog).toHaveKey("logMessage")
                expect(appenderCallLog.logMessage).toHaveLength(1)
                expect(appenderCallLog.logMessage[1]).toSatisfy((actual) => {
                    expect(actual[1].getMessage()).toBe("getMessage was called")
                    expect(actual[1].getSeverity()).toBe(logger.logLevels.DEBUG)
                    expect(actual[1].getTimestamp()).toBeCloseTo(now(), 2, "s")
                    return true
                }, "Log entry is not correct")
            })
        })
    }
}
