use Algorithm::QuickSort;

role Sort {
	method sort(@array) { ... }
}

class QuickSort does Sort {

	method sort(@array) {
		return quicksort([@array]);
	}

}

