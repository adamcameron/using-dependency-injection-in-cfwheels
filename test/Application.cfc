component extends=ApplicationProxy  {

	this.mappings["/tmp"] =  GetTempDirectory()

	public boolean function onApplicationStart() {
		super.onApplicationStart()
        fixAppPaths()
		set(showErrorInformation=true)
		return true
	}

	public boolean function onRequestStart(required string targetPage) {
		super.onRequestStart(argumentCollection=arguments)
		set(cacheQueriesDuringRequest=false)

		return true
	}

	public void function onRequestEnd(required string targetPage){
		// do not run the application's own one
	}

	private void function fixAppPaths() {
		set(rootPath = "/")
		set(rootComponentPath = "")
		set(wheelsComponentPath = "wheels")
		set(modelPath = "/models")
		set(viewPath = "/views")
		set(controllerPath="/controllers")
	}

}
