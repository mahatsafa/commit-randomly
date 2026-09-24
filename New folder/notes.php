<?php
// php notes
function greet($name) {
    return "hello " . $name;
}

echo greet("practice") . "\n";

$nums = [1, 2, 3];
$doubled = array_map(fn($n) => $n * 2, $nums);
print_r($doubled);

// TODO: try classes/OOP next
?>
