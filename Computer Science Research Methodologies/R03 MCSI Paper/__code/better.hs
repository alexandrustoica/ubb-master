main = do
    resultF <- f(4, "test")
    resultG <- g("test", 4.0)
    return h(resultF, resultG)
    
    