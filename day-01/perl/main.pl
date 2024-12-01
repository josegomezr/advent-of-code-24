#!/usr/bin/env perl -w
use English; # $ARG = $_
use Data::Dumper;

# Regular array here
my @positions = ();

# Feed positions
# open(my $fh, '<', '../sample');
open(my $fh, '<', '../input');

while (my $line = <$fh>) {
	my ($left, $right) = split(/\s+/, $line);
	# array ref here, perl doesn't need casting ;)
	push @positions, [$left, $right];
}

# Pick left & right from the table
my @left_list = sort map { $ARG->[0] } @positions;
my @right_list = sort map { $ARG->[-1] } @positions;

# part one:
# compute distances.
my @distances = map { abs($_) } map { $left_list[$_] - $right_list[$_] } 0..$#left_list;

my $distance_sum = 0;
$distance_sum += $_ for @distances;

printf("distance: %d\n", $distance_sum);

# part two:
# compute similarity. Using array in scalar context returns size of array
my @similarities = map {
	my $left = $left_list[$_];
	$left * (grep { $_ == $left } @right_list)
} 0..$#left_list;

my $similarity_sum = 0;
$similarity_sum += $_ for @similarities;

printf("similarity: %d\n", $similarity_sum);