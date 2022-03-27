import logbox.system.logging.AbstractAppender
import logbox.system.logging.LogEvent

component extends=AbstractAppender {

    public function init() {
        variables.log = []
        super.init(argumentCollection=arguments)
    }

    public function logMessage(LogEvent logEvent) {
        variables.log.append({
            timestamp = logEvent.getTimestamp(),
            severity = logEvent.getSeverity(),
            message = logEvent.getMessage()
        })
    }

    public function getLog() {
        return variables.log
    }
}
