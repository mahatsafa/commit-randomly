# ruby practice notes
def greet(name)
  "hello #{name}"
end

puts greet("practice")

nums = [1, 2, 3, 4, 5]
doubled = nums.map { |n| n * 2 }
puts doubled.inspect

# TODO: try blocks & procs next
