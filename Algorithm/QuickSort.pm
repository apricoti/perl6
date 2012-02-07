module Algorithm::QuickSort;

# Empty list sorts to the empty list
multi sub quicksort([]) is export { () }
 
# Otherwise, extract first item as pivot...
multi sub quicksort([$pivot, *@rest]) is export {
     # Partition.
     my @before = @rest.grep(* < $pivot);
     my @after  = @rest.grep(* >= $pivot);
 
     # Sort the partitions.
     (quicksort(@before), $pivot, quicksort(@after))
}
