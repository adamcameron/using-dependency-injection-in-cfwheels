import test.BaseSpec

component extends=BaseSpec {

    function run() {
        describe("Tests for onApplicationStart", () => {
            it("puts an instance of DependencyInjectionService into cache", () => {
                diService = $getFromCache("diService")

                expect(diService).toBeInstanceOf("services.DependencyInjectionService")
            })
        })
    }
}
