class EmptyBufferException extends Exception {}
class FullBufferException extends Exception {}

class CircularBuffer {
    CircularBuffer(int capacity) {
        this.capacity = capacity
        this.values = []
    }
    
    private LinkedList values = []
    
    int capacity = 0

    def clear() {
        values.clear()
    }

    def read() {
        if (!values) throw new EmptyBufferException()
        values.removeFirst()
    }

    def write(int item) {
        if (values.size() == capacity) throw new FullBufferException()
        values.addLast(item)
    }

    def overwrite(int item) {
        if (capacity < 1) throw new FullBufferException()
        if (values.size() == capacity) values.removeFirst()
        values.addLast(item)
    }
}
