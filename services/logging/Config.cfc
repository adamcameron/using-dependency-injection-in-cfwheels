component {
    function configure() {
        variables.logBox = {
            appenders = {
                DummyAppender = {
                    class = "logbox.system.logging.appenders.DummyAppender"
                }
            }
        }
    }
}
