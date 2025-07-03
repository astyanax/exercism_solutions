import java.util.List;
import java.util.Collections;

public class BinarySearch {
    List<Integer> list;

    public BinarySearch(List<Integer> list) {
        this.list = list;
    }

    public int indexOf(Integer number) throws ValueNotFoundException {
        if (list.indexOf(number) == -1)
            throw new ValueNotFoundException("Value not in array");
        return Collections.binarySearch(list, number);
    }
}