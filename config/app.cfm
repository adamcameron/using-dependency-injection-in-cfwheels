<cfscript>
// Use this file to set variables for the Application.cfc's "this" scope.

// Examples:
// this.name = "MyAppName";
// this.sessionTimeout = CreateTimeSpan(0,0,5,0);

this.datasources["cfwudi"] = {
    type = "mysql",
    host = "database.backend",
    port = 3306,
    database = "cfwudi",
    username = "cfwudi",
    password = server.system.environment.MARIADB_PASSWORD,
    custom = {
        useUnicode = true,
        characterEncoding = "UTF-8"
    }
}

this.datasource = "cfwudi"
this.localmode = "modern"
this.bufferOutput = true
</cfscript>
