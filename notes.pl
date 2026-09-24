# perl notes
sub greet {
    my ($name) = @_;
    return "hello $name";
}

print greet("practice"), "\n";

my @nums = (1, 2, 3);
my @doubled = map { $_ * 2 } @nums;
print "@doubled\n";

# TODO: try references next
