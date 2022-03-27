import test.BaseSpec
import logbox.system.logging.config.LogBoxConfig
import logbox.system.logging.LogBox
import services.logging.Config

component extends=BaseSpec {

    function run() {
        describe("Tests for InMemoryAppender", () =>{
            it("logs an entry", () => {
                config = new Config()
                logboxConfig = new LogBoxConfig(config)
                logbox = new LogBox(logboxConfig)
                logger = logbox.getRootLogger()

                logger.info("TEST_INFO")
                mockbox.prepareMock(logbox)
                appender = logbox.$getProperty("appenderRegistry").inMemoryAppender
                testLog = appender.getLog()

                expect(testLog).toHaveLength(1)
                expect(testLog[1]).toSatisfy((actual) => {
                    expect(actual.message).toBe("TEST_INFO")
                    expect(actual.severity).toBe(3)
                    expect(actual.timestamp).toBeCloseTo(now(), 2, "s")
                    return true
                }, "Log entry is not correct")
            })
        })
    }
}
