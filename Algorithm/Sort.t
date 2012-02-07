use Test;

use Algorithm::Sort;

my $sorter = QuickSort.new;

my @result = $sorter.sort([1,5,3,6,7,9,8,24,17]);
ok("{1,3,5,6,7,8,9,17,24}","{$sorter.sort([1,5,3,6,7,9,8,24,17])}");
log "{@result}";

