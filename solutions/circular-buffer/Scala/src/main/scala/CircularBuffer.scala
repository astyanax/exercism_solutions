class EmptyBufferException() extends Exception
class FullBufferException() extends Exception

class CircularBuffer(var capacity: Int):
  var elements = scala.collection.mutable.Queue[Int]()

  def write(value: Int) =
    if isFull then throw FullBufferException()
    else elements.append(value)

  def read(): Int =
    if elements.isEmpty then throw EmptyBufferException()
    else elements.dequeue()

  def overwrite(value: Int) =
    if isFull then read()
    write(value)

  def clear() = elements.clear()

  inline private def isFull = elements.length == capacity
