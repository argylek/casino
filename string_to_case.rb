# variables
name = 'Scott'

# functions
def case_change(text, boolean)
  if boolean
    return text.upcase
  else
    return text.downcase
  end
end

def hello (name)
  'Hello ' + name
end

def all_together(text, boolean)
  change = case_change(text, boolean)
  hello(change)
end

# returns
puts case_change('yoYo', true)
puts case_change('yoYo', false)

puts hello(name)

puts all_together(name, true)
puts all_together('Steve', false)