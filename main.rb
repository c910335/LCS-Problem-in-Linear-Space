def scores_between(xs, options = { and: '' })
  ys = options[:and]
  scores = [0] * (ys.size + 1)
  pre_score = 0
  xs.each_char do |x|
    pre_score = 0
    ys.each_char.with_index do |y, i|
      scores[i + 1], pre_score = [ x == y ? (pre_score + 1) : 0, scores[i], scores[i + 1] ].max, scores[i + 1]
    end
  end
  scores
end

def lcs_of(xs, options = { and: '' })
  ys = options[:and]
  return '' if xs.empty? || ys.empty?
  return xs if xs.size == 1 && ys.include?(xs)
  return ys if ys.size == 1 && xs.include?(ys)

  mid = xs.size / 2
  max_score, secant = scores_between(xs[0...mid], and: ys)
    .zip(scores_between(xs[mid..-1].reverse!, and: ys.reverse).reverse!)
    .map!(&:sum)
    .each_with_index
    .max

  if max_score == 0
    ''
  else
    lcs_of(xs[0...mid], and: ys[0...secant]) + lcs_of(xs[mid..-1], and: ys[secant..-1])
  end
end

t = gets.to_i
t.times do
  xs, ys = gets.chomp.split
  puts lcs_of xs, and: ys
end
