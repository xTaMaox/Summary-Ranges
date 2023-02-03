defmodule Solution do
  @spec summary_ranges(nums :: [integer]) :: [String.t]
  def summary_ranges([]) do
    []
  end

  def summary_ranges(nums) do
    run(nums, nil, nil, [])
    |> Enum.reverse()
  end

  # The End of Nums
  def run(_nums = [], last, start, run) when start == last do
    ["#{last}" | run]
  end

  def run(_nums = [], last, start, run) do
    ["#{start}->#{last}" | run]
  end

  # The Beginning of Nums
  def run(_nums = [curr | tail], _last = nil, _start = nil, run) do
    run(tail, curr, curr, run)
  end

  # The Middle of Nums
  def run(_nums = [curr | tail], last, start, run) when (curr != last + 1) and start == last do
    # curr != last + 1, therefore the end of a range was reached in the last read
    # start is also == to the last, therefore the last read was a range of one item
    # push it onto the run and move on
    run(tail, curr, curr, ["#{last}" | run])
  end

  def run(_nums = [curr | tail], last, start, run) when (curr != last + 1) do
    # curr != last + 1, therefore the end of a range was reached in the last read
    # push it onto the run and move on
    run(tail, curr, curr, ["#{start}->#{last}" | run])
  end

  def run(_nums = [curr | tail], last, start, run) do
    run(tail, curr, start, run)
  end
end
