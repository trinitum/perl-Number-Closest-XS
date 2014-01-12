use Test::Most 0.22;
use Number::Closest::XS ':all';

eq_or_diff
  find_closest_numbers( center => 50, list => [ 10, 20, 30 ] ),
  [30], "30 is closest to 50";
eq_or_diff
  find_closest_numbers( center => 50, list => [ 10, 20, 30, 40, 52, ] ),
  [52], "now 52 is closest to 50";
eq_or_diff(
    find_closest_numbers(
        center => 50,
        list   => [ 10, 20, 30, 49, 52, ],
        amount => 3,
    ),
    [ 49, 52, 30 ],
    "got three closest numbers sorted by distance"
);
eq_or_diff(
    find_closest_numbers(
        center => 50,
        list   => [ 52, 49, 21, 35 ],
        amount => 5,
    ),
    [ 49, 52, 35, 21 ],
    "got four closest numbers sorted by distance"
);

done_testing;
