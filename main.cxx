#include <algorithm>
#include <iostream>
#include <iterator>
#include <string>
#include <string_view>
#include <vector>

template<class Iterator>
std::vector<int> scoresBetween(const Iterator &, const Iterator &, const Iterator &, const Iterator &);
std::string lcs(const std::string_view &, const std::string_view &);

int main() {
	int T;
	std::ios::sync_with_stdio(false);

	std::cin >> T;
	while (T--) {
		std::string X, Y;
		std::cin >> X >> Y;

		std::cout << lcs(X, Y) << std::endl;
	}

	return 0;
}

std::string lcs(const std::string_view &x, const std::string_view &y) {
	if (x.length() == 0 || y.length() == 0) return "";
	if (x.length() == 1 && y.find_first_of(x) != std::string_view::npos) return { x[0] };
	if (y.length() == 1 && x.find_first_of(y) != std::string_view::npos) return { y[0] };

	auto mid = x.length() / 2;
	auto scores = scoresBetween(
			x.cbegin(), x.cbegin() + mid,
			y.cbegin(), y.cend()
			);
	auto scoresRight = scoresBetween(
			x.crbegin(), x.crbegin() + (x.length() - mid),
			y.crbegin(), y.crend()
			);
	std::transform(scores.cbegin(), scores.cend(), scoresRight.crbegin(), scores.begin(), std::plus<int>());
	auto maxIterator = std::max_element(scores.cbegin(), scores.cend());
	auto secant = std::distance(scores.cbegin(), maxIterator);

	return *maxIterator == 0 ? "" : (
			lcs(x.substr(0, mid), y.substr(0, secant)) +
			lcs(x.substr(mid), y.substr(secant))
			);
}

template<class Iterator>
std::vector<int> scoresBetween(const Iterator &xStart, const Iterator &xEnd, const Iterator &yStart, const Iterator &yEnd) {
	std::vector<int> scores(std::distance(yStart, yEnd) + 1, 0);
	int preScore = 0;

	for (auto x = xStart; x != xEnd; ++x) {
		preScore = 0;
		for (int i = 0; yStart + i != yEnd; ++i) {
			auto y = yStart + i;
			auto tmp = scores[i + 1];
			scores[i + 1] = std::max({
					*x == *y ? preScore + 1 : 0,
					scores[i],
					scores[i + 1]
					});
			preScore = tmp;
		}
	}

	return scores;
}
