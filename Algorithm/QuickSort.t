use Test;

use Algorithm::QuickSort;

my @result = quicksort([1,5,3,6,7,9,8,24,17]);
ok("{1,3,5,6,7,8,9,17,24}","{@result}");
log "{@result}";

