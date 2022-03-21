component extends="Controller"{
    function hello() {
        time = Now()

        tests = model("Test").findAll()
        renderView(time=time)
    }
    function goodbye() {
    }
}
