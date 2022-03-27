<cfscript>
    import testbox.system.TestBox

	setting requestTimeout=0;

	param URL.testBundles="";
	if (URL.testBundles.len()) {
		param URL.directories = "";
	}else{
		param URL.directories="test.integration,test.unit";
	}

	testbox = new TestBox(
		bundles = URL.testBundles.listToArray(),
        directories = URL.directories.listToArray()
    )

	// runs the tests with either HTML output if we browse to this file, or as text if it's run from the shell
	reportFormat = url.keyExists("reportFormat") ? url.reportFormat : "SimpleReporter"
	result = testbox.run(
		reporter = "testbox.system.reports.#reportFormat#"
	)
	writeOutput(result.trim())
</cfscript>
