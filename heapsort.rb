class Heapsort
  def sort(arr)
    res = nil
    res = build_max_heap(arr)

    for i in arr.size.downto(2)
      res = exchange(res, 1, i)
      @heap_size = @heap_size - 1
      res = max_heapify(res, 1)
    end

    res
  end

  private

  def build_max_heap(arr)
    @heap_size = arr.size
    res = nil

    for i in (arr.size / 2).downto(1)
      res = max_heapify(arr, i)
    end

    res
  end

  def max_heapify(arr, i)
    largest = nil
    l = left(i)
    r = right(i)

    if l <= @heap_size && arr[l - 1] > arr[i - 1]
      largest = l
    else
      largest = i
    end

    if r <= @heap_size && arr[r - 1] > arr[largest - 1]
      largest = r
    end
    
    if largest != i
      arr = exchange(arr, i, largest)
      arr = max_heapify(arr, largest)
    end

    arr
  end

  def exchange(arr, i, j)
    t = arr[i - 1]
    arr[i - 1] = arr[j - 1]
    arr[j - 1] = t

    arr
  end

  def parent(i)
    i / 2
  end

  def left(i)
    2 * i
  end

  def right(i)
    2 * i + 1
  end
end

data = [4, 1, 3, 2, 16, 9, 10, 14, 8, 7]
puts Heapsort.new.sort(data).inspect
