def scores_between(xs : String, and ys : String = "") : Array(Int32)
  scores = [0] * (ys.size + 1)
  pre_score = 0
  xs.each_char do |x|
    pre_score = 0
    ys.each_char_with_index do |y, i|
      scores[i + 1], pre_score = {x == y ? (pre_score + 1) : 0, scores[i], scores[i + 1]}.max, scores[i + 1]
    end
  end
  scores
end

def lcs_of(xs : String, and ys : String = "") : String
  return "" if xs.empty? || ys.empty?
  return xs if xs.size == 1 && ys.includes?(xs)
  return ys if ys.size == 1 && xs.includes?(ys)

  mid = xs.size / 2
  max_score, secant = scores_between(xs[0...mid], and: ys)
    .zip(scores_between(xs[mid..-1].reverse, and: ys.reverse).reverse!)
    .map_with_index! { |scores, i| {scores.sum, i} }
    .max_by(&.[0])

  if max_score == 0
    ""
  else
    lcs_of(xs[0...mid], and: ys[0...secant]) + lcs_of(xs[mid..-1], and: ys[secant..-1])
  end
end

t = gets.to_s.to_i
t.times do
  xs, ys = gets.to_s.chomp.split
  puts lcs_of xs, and: ys
end
