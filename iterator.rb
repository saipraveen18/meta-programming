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
