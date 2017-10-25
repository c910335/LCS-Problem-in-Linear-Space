ALPHABETS = ('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a

def random_string(size = 1000)
  String.build do |s|
    size.times do
      s << ALPHABETS.sample
    end
  end
end

puts 20
15.times do
  puts "#{random_string rand 5..1000} #{random_string rand 5..1000}"
end
3.times do
  puts "#{random_string} #{random_string}"
end
puts "#{"A" * 1000} #{"B" * 1000}"
puts "#{"A" * 1000} #{"A" * 1000}"
