
class Log<A> private constructor(
    private val instance: A) {

    companion object {
        fun <A> just(instance: A):
            Log<A> = Log(instance)
    }

    fun <B> bind(f: (A) -> Log<B>):
        Log<B> = instance
            .also { println(it) }
            .let(f)
            
     fun value(): A = instance
}
    
Log.just(f(4, "test")).bind { lhs ->
Log.just(g("test", 4.0f).bind { rhs ->
    h(lhs, rhs) }) }