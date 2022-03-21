component extends=test.BaseSpec {

    function run() {
        describe("Tests that models can be fetched from the DB", () => {
            it("fetches Test objects", () => {
                tests = model("Test").findAll()
                expect(tests).toBeQuery()
                expect(tests.columnList).toBe("id,value")
            })
        })
    }
}
