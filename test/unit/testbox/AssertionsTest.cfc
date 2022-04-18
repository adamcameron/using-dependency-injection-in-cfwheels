import test.BaseSpec

component extends=BaseSpec {

    function run() {
        describe("Tests TestBox assertions", () => {
            describe("Tests toThrow", () => {
                it("should pass because it DOES throw an exception with the matching message", () => {
                    expect(() => throwExceptionWithMatchingMessage()).toThrow(regex="^.*MATCH_THIS.*$")
                })
            })
            describe("Tests notToThrow", () => {
                it("should pass because it is throwing a different exception", () => {
                    expect(() => throwDifferentException()).notToThrow(regex="^.*MATCH_THIS.*$")
                })
                it("should fail because it DOES throw an exception with the matching message", () => {
                    expectTestBoxBug(() => {
                        expect(() => throwExceptionWithMatchingMessage()).notToThrow(regex="^.*MATCH_THIS.*$")
                    })
                })
                it("should fail because it DOES throw an exception with the matching detail", () => {
                    expectTestBoxBug(() => {
                        expect(() => throwExceptionWithMatchingDetail()).notToThrow(regex="^.*MATCH_THIS.*$")
                    })
                })
                it("should fail because it DOES throw an exception that matches on both message and detail", () => {
                    expectTestBoxBug(() => {
                        expect(() => throwExceptionWithMatchingMessageAndDetail()).notToThrow(regex="^.*MATCH_THIS.*$")
                    })
                })
            })
        })
    }

    function throwDifferentException() {
        throw(message="DIFFERENT_MESSAGE", detail="DETAIL_MATCH_THIS")
    }

    function throwExceptionWithMatchingMessage() {
        throw(message="MESSAGE_MATCH_THIS")
    }

    function throwExceptionWithMatchingDetail() {
        throw(detail="DETAIL_MATCH_THIS")
    }

    function throwExceptionWithMatchingMessageAndDetail() {
        throw(message="BOTH_MATCH_THIS", detail="BOTH_MATCH_THIS")
    }

    function expectTestBoxBug(required function testCase){
        try{
            testCase()
            throw(type="NoAssertionFailedException")
        } catch (NoAssertionFailedException e) {
            // this is expected: it's the TestBox bug
        } catch (TestBox.AssertionFailed e) {
            fail("Seems TestBox have fixed the bug in notToExpect, as it's working properly now. This test can be retired.")
        }
    }
}
