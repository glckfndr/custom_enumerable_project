module Enumerable
  def my_each_with_index
    ind = 0
    self.my_each do |el|
      yield el, ind
      ind += 1
    end
  end

  def my_count
    return size unless block_given?
    counter = 0
    self.my_each do |el|
      counter += 1 if (yield el)
    end
    counter
  end

  def my_select
    selection = []
    self.my_each do |el|
      selection << el if (yield el)
    end
    selection
  end

  def my_map
    selection = []
    self.my_each do |el|
      selection << (yield el)
    end
    selection
  end

  def my_inject(initial_val)
    sum = initial_val
    self.my_each do |el|
      sum = (yield sum, el)
    end
    sum
  end

  def my_none?
    self.my_each do |el|
      return false  if (yield el)
    end
    true
  end

  def my_all?
    self.my_each do |el|
      return false  unless (yield el)
    end
    true
  end

  def my_any?
    self.my_each do |el|
      return true  if (yield el)
    end
    false
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    c = 0
    until c == size
      yield self[c]
      c += 1
    end
    self
  end
end
