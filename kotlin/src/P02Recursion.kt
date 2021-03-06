import kotlin.test.assertEquals

object P02Recursion {
    @JvmStatic
    fun main(args: Array<String>) {
        val xs = listOf(5, 3, 90, -1, 2)

        assertEquals(90, max(xs))
        assertEquals(0, max(emptyList()))
    }

    fun max(xs: List<Int>): Int {
        return when {
            xs.isEmpty() -> 0
            xs.size == 1 -> xs.first()
            else -> {
                val head = xs.first()
                val tail = xs.drop(1)
                val maxTail = max(tail)
                if (head > maxTail) head else maxTail
            }
        }
    }
}