class String
  def subsequence_of?(text)
    return true if empty?
    i = 0
    text.each_char do |char|
      if char == self[i]
        i += 1
        break if i == size
      end
    end
    i == size
  end
end

def lcs_size(xs, ys)
  c = Array(Array(Int32)).new(xs.size + 1) { [0] * (ys.size + 1) }
  xs.each_char_with_index do |x, i|
    ys.each_char_with_index do |y, j|
      c[i + 1][j + 1] = {x == y ? (c[i][j] + 1) : 0, c[i + 1][j], c[i][j + 1]}.max
    end
  end
  c[xs.size][ys.size]
end

exit if ARGV.size != 2
test_data, output = ARGV.map { |file| File.open file }

pass = true
t = test_data.gets.to_s.to_i
t.times do |i|
  xs, ys = test_data.gets.to_s.chomp.split
  lcs = output.gets.to_s
  if lcs_size(xs, ys) != lcs.size || !(lcs.subsequence_of?(xs) && lcs.subsequence_of?(ys))
    puts "Failed at case #{i + 1}"
    pass = false
  end
end

puts "Passed" if pass
exit 1 unless pass
