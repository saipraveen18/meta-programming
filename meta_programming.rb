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

##########

# Add a new method to sting to split into words since string do not have that capabilty.

class String
  def words
    split(' ')
  end
end

"Programmer Best Friend".words
#['Programmer', 'Best', 'Friend']

class Integer
  def factorial
    (1..self).inject(&:*) || 1
  end
end

5.factorial #Gives factorial. remember self here.

########

# Method Missing. It accepts method_name, list of args, block as arguments

class Hello
  def method_missing(method_name, *args, &block)
    puts "There is no such method - #{method_name}"
  end
end

Hello.new.ruby

#########

# Singleton class - Method belongs to specific object in a class

class Foo
  def method1
    puts "method1"
  end
end

foo = Foo.new

def foo.method2
  puts "This is Singleton Method and can only be accessible with foo object"
end

puts foo.method2

foobar = Foo.new
foobar.method1 # Gives o/p
foobar.method2 # Throws error

########


