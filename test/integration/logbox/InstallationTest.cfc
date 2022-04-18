import test.BaseSpec
import logbox.system.logging.LogBox

component extends=BaseSpec {

    function run() {
        describe("Tests the LogBox install", () => {
            it("is instantiable", () => {
                expect(() => getComponentMetadata("LogBox")).notToThrow()
            })
        })
    }
}
