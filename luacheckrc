stds = {
    lshost = {
        globals = {
            "lib",
            "Prelink",
            "BB",
            "InitLib1",
            "InitLib2",
            "table",
            "RegisterLib",
            "tostring",
            "xpcall",
            "type",
            "error",
            "pairs",
            "TestComp",
            "TestGet",
            "TestSetValue",
            "TestBuild"
            }, -- these globals can be set and accessed.
        read_globals = {"quux"} -- these globals can only be accessed.
    }
}

std = "max+lshost"
max_line_length = 180
ignore = { "614", "612", "611" }
allow_defined = true
