import test.BaseSpec

component extends=BaseSpec {

    function run() {
        describe("Tests the CFWheels install", () => {
            it("displays the welcome page", () => {
                cfhttp(url="http://lucee:8888/index.cfm", result="httpResponse");

                expect(httpResponse.statusCode).toBe(200)
                expect(httpResponse.fileContent).toInclude("<title>CFWheels</title>")
            })
        })
    }
}
