# powershell notes
function Greet($name) {
    return "hello $name"
}

Write-Output (Greet "practice")

$nums = 1,2,3
$doubled = $nums | ForEach-Object { $_ * 2 }
Write-Output $doubled

# TODO: try pipelines deeper next
