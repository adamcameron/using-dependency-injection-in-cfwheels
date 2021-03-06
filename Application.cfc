component {

    setsettings()
    loadDatasources()
    loadMappings()
    loadCfWheels()

    private void function setSettings() {
        this.name = "cfwudi"
        this.localMode = "modern"
        this.bufferOutput = true
    }

    private void function loadDataSources() {
        this.datasources[this.name] = {
            type = "mysql",
            host = "database.backend",
            port = 3306,
            database = this.name,
            username = this.name,
            password = server.system.environment.MARIADB_PASSWORD,
            custom = {
                useUnicode = true,
                characterEncoding = "UTF-8"
            }
        }

        this.datasource = this.name
    }

    private void function loadMappings() {
    }

    private void function loadCfWheels() {
        include "wheels/functions.cfm";
    }
}
