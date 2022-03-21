<cfscript>
	setting requestTimeout=0;
	param URL.suiteList="acceptance,functional,integration,unit";
	suites = URL.suiteList.listReduce((suites=[], suite) => suites.append("test.#suite#"))

	// runs the tests with either HTML output if we browse to this file, or as text if it's run from the shell
	reportFormat = url.keyExists("reportFormat") ? url.reportFormat : "SimpleReporter"
	testBox = new testbox.system.TestBox(directories=suites)
	result = testBox.run(
		reporter = "testbox.system.reports.#reportFormat#"
	)
	writeOutput(result.trim())
</cfscript>
