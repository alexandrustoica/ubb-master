f(4, "test").bind { it }.bind { lhs ->
g("test", 4.0f).bind { it }.bind { rhs ->
    h(lhs, rhs)}}