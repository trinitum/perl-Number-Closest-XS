use Test::Most 0.22;
use Number::Closest::XS ':all';

eq_or_diff find_closest_numbers(50, [10, 20, 30]), [30], "30 is closest to 50";
eq_or_diff find_closest_numbers(50, [10, 20, 30, 40, 52,]), [52], "now 52 is closest to 50";
eq_or_diff(find_closest_numbers(50, [10, 20, 30, 49, 52,], 3,), [49, 52, 30], "got three closest numbers sorted by distance");
eq_or_diff(find_closest_numbers(50, [52, 49, 21, 35], 5,), [49, 52, 35, 21], "got four closest numbers sorted by distance");

eq_or_diff find_closest_numbers_around(50, [10, 20, 30, 40,]), [30, 40], "30 and 40 are closest around 50";
eq_or_diff find_closest_numbers_around(50, [20, 30, 40, 52, 55,]), [40, 52], "40 and 52 are closest around 50";
eq_or_diff find_closest_numbers_around(50, [20, 30, 40, 52, 55, 57, 59,], 3,), [40, 52, 55], "40, 52 and 55 are closest three around 50";
eq_or_diff find_closest_numbers_around(50, [20, 30, 40, 52, 55, 57, 59, 60,], 4,), [40, 52, 55, 57], "40, 52, 55 and 57 are closest four around 50";
eq_or_diff find_closest_numbers_around(50, [20, 30, 40, 42, 47, 49, 52, 55, 57, 59, 60,], 5,), [47, 49, 52, 55, 57], "47, 49, 52, 55 and 57 are closest five around 50";
eq_or_diff find_closest_numbers_around(50, [10, 20, 30, 40,], 10), [10, 20, 30, 40], "returned all closest points when amount is bigger than number of points";

done_testing;
