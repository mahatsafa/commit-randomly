// typescript notes
interface User {
    name: string;
    age: number;
}

const user: User = { name: "practice", age: 1 };

function greet(u: User): string {
    return `hello ${u.name}`;
}

console.log(greet(user));

// generics practice
function identity<T>(x: T): T {
    return x;
}
// TODO: try utility types next
