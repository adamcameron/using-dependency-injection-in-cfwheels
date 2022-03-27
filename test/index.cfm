<cfscript>
    import testbox.system.TestBox

	setting requestTimeout=0;

	param URL.testBundles="";
	if (URL.testBundles.len()) {
		param URL.directories = "";
	}else{
		param URL.directories="test.functional,test.integration,test.unit";
	}

	testbox = new TestBox(
		bundles = URL.testBundles.listToArray(),
        directories = URL.directories.listToArray()
    )

	result = testbox.run(reporter="test.system.reports.SimpleReporter")
	writeOutput(result.trim())
</cfscript>
