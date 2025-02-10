class Quicksort
  def sort(arr, p, r)
    res = arr
    if p < r
      res, q = partition(arr, p, r)
      res = quicksort(arr, p, q - 1)
      res = quicksort(arr, q + 1, r)
    end

    res
  end

  private

  def partition
  end
end