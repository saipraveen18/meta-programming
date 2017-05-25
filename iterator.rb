# Using Define Method create new mwthods

class Iterator
  class << self
    define_method :my_each do |arr|
      puts arr
    end
  end
end

arr = [1, 2, 3]

Iterator.my_each(arr)

# If we use instance_eval or class_eval no define_method

Iteratorr = Iterator.new

#===============================

# Using Class Eval

foo = Class.new
foo.class_eval do
  def this_is_class
    puts "This is Class Eval"
  end
end

foo.new.this_is_class

# Using Instance Eval

foo.instance_eval do
  def this_is_instance
    puts "This is Instance Eval"
  end
end

foo.this_is_instance

############

# Using Yield - Yield always evaluates the block, Yield is a magical keyword and not a method

foo.instance_eval do
  def this_is_yield
    yield
  end
end

foo.this_is_yield {puts "hello this is yield #{2 + 3}"}

###########

foo.instance_eval do
  def this_is_yield_with_args(a, b)
    puts "This is yield with arguments #{yield(a, b)}"
  end
end

foo.this_is_yield_with_args(2, 3) {|a, b| a + b}







