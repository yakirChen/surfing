// hello go

package main

import "fmt"

var hello = "hello"

func main() {
	x, y := greeting("yakir")
	fmt.Println(x, y)

	hello_world := "hello world"
	fmt.Println(hello_world)

	sum := sum(1, 100)
	fmt.Println(sum)
}

func greeting(name string) (string, string) {
	return hello, name
}

func sum(start, end int) int {

	sum := 0
	for i := start; i <= end; i++ {
		sum += i
	}

	return sum
}
