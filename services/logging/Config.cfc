component {
    function configure() {
        variables.logBox = {
            appenders = {
                InMemoryAppender = {
                    class = "services.logging.InMemoryAppender"
                }
            },
            root = {
                appenders="*"
            },
            categories = {
                default = {
                    levelMin = "fatal",
                    levelMax = "info",
                    appenders = "InMemoryAppender"
                }
            }
        }
    }
}
