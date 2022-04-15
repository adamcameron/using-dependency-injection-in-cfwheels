component extends=testbox.system.BaseSpec {

	decorateTestSpecWithDispatch()
	set(cacheQueriesDuringRequest=false)

	mockbox = getMockBox(generationPath="/tmp/")

	private void function decorateTestSpecWithDispatch()	{
		variables.append(application.wheels.dispatch)
	}

	private any function it() {
		application.wheels.models = {}
		application.wheels.controllers = {}
		return super.it(argumentCollection=arguments)
	}
}
