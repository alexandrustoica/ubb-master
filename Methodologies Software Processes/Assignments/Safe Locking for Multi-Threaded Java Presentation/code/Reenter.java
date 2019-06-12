class X {
    private final ReentrantLock lock = 
        new ReentrantLock();
   
    public void method() {
        lock.lock();  // blocks
        try { 
            // body
        } finally { lock.unlock() }
    }
}