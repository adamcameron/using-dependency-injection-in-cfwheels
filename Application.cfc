component {

    setsettings()
    loadDatasources()
    loadMappings()

    private void function setSettings() {
        this.name = "cfwudi"
        this.localMode = "modern"
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
}
