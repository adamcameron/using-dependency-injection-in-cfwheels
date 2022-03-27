<cfscript>
    import testbox.system.TestBox

	setting requestTimeout=0;

	param URL.testBundles="";
	if (URL.testBundles.len()) {
		param URL.directories = "";
	}else{
		param URL.directories="integration,unit";
	}

	testbox = new TestBox(
		bundles = URL.testBundles.listReduce(qualifyTestElements, []),
		directories = URL.directories.listReduce(qualifyTestElements, [])
	)

	// runs the tests with either HTML output if we browse to this file, or as text if it's run from the shell
	reportFormat = url.keyExists("reportFormat") ? url.reportFormat : "SimpleReporter"
	result = testbox.run(
		reporter = "testbox.system.reports.#reportFormat#"
	)
	writeOutput(result.trim())

	function qualifyTestElements(elements, element) {
		qualified_element = element.listFirst(".") == "test" ? element : element.listPrepend("test", ".")
		return elements.append(qualified_element)
	}
</cfscript>
