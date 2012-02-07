

class BinaryTreeNode {
	has $.left;
	has $.right;
	has $.value;
}

class BinaryTreeWalker {

	method traversePreOrder($root,&visit) {
		return unless $root;
		visit($root);
		self.traversePreOrder($root.left, &visit) if $root.left;
		self.traversePreOrder($root.right, &visit) if $root.right;
	}

	method traverseInOrder($root,&visit) {
		return unless $root;
		self.traverseInOrder($root.left, &visit) if $root.left;
		visit($root);
		self.traverseInOrder($root.right, &visit) if $root.right;
	}

	method traversePostOrder($root,&visit) {
		return unless $root;
		self.traversePostOrder($root.left, &visit) if $root.left;
		self.traversePostOrder($root.right, &visit) if $root.right;
		visit($root);
	}
}

class NonRecursiveBinaryTreeWalker {

	method traversePostOrder($root,&visit) {
		my @stack = ();
		my $cur = $root;
		my $parent;
		while ($cur) {
			# phase 1, find and visit deepest left-most leaf
			while ($cur.left or $cur.right) {
				@stack.push($cur);
				if $cur.left {
					$cur = $cur.left;
				}
				elsif $cur.right {
					$cur = $cur.right;
				}
			}
			visit($cur);
			# phase 2, backtrack. if we were the left node, find the next right node. if we were in the right node, backtrack until we find a right node that is not our ancestor
			$parent = @stack.pop();
			if ( !$parent ) {
				$cur = Nil; # this happens if the tree had just a single node
			}
			while ( $cur and $parent ) {
				while ( $parent and $cur === $parent.left and !$parent.right ) {
					$cur = $parent;
					$parent = @stack.pop();
					visit($cur);
				}
				while ( $parent and $cur === $parent.right ) {
					$cur = $parent;
					$parent = @stack.pop();
					visit($cur);
				}
				if ( !$parent ) {
					$cur = Nil; # we just processed the root node, so traversal is done
				}						
				if ( $parent and $parent.right ) {
					@stack.push($parent);
					$cur = $parent.right;
					$parent = Nil; # signal to stop the backtracking					
				}
			}
		}
	}

}



1;
