use Test;
use Algorithm::BinaryTree;

sub node($value,$left?,$right?) {
	return BinaryTreeNode.new(value=>$value, left=>$left, right=>$right);
}

# $root is the root node if a binary tree
# $resultStr is the order the nodes are expected, separated by spaces. Ex: "D E B F G C A"
sub test($root,$resultStr) {
	my @result = ();
	my @resultNR = ();
	my $tree = BinaryTreeWalker.new;
	my $treeNR = NonRecursiveBinaryTreeWalker.new;
	$tree.traversePostOrder($root, -> $x { @result.push($x.value); } );	
	$treeNR.traversePostOrder($root, -> $x { @resultNR.push($x.value); } );	
	ok("{@result}", "{@resultNR}", desc=> $resultStr);
}

my $balancedTree3 = node("A",
	node("B",
		node("D"),
		node("E")
	),
	node("C",
		node("F"),
		node("G")
	)
);

test($balancedTree3,"D E B F G C A");

test(Nil, "");

my $singleNode = node("A");
test($singleNode, "A");

my $singleLeftLeaf = node("A",node("B"));
test($singleLeftLeaf, "B A");

my $singleRightLeaf = node("A",Nil,node("C"));
test($singleRightLeaf, "C A");

my $balancedHeight2 = node("A",node("B"),node("C"));
test($balancedHeight2, "C B A");

my $longLeftOnlyBranch = node("A",node("B",node("C",node("D",node("E")))));
test($longLeftOnlyBranch, "E D C B A");

my $longRightOnlyBranch = node("A",Nil,node("B",Nil,node("C",Nil,node("D",Nil,node("E")))));
test($longRightOnlyBranch, "E D C B A");

my $slightlyRightThenLeftBranch = node("A",Nil,node("B",node("C",node("D",node("E")))));
test($slightlyRightThenLeftBranch, "E D C B A");

my $slightlyLeftThenRightBranch = node("A",node("B",Nil,node("C",Nil,node("D",Nil,node("E")))));
test($slightlyLeftThenRightBranch, "E D C B A");

my $waveBranch = node("A",node("B",Nil,node("C",node("D",Nil,node("E")))));
test($waveBranch, "E D C B A");

