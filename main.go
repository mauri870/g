package main

import (
	"fmt"
	"sync"
)

func main() {
	fmt.Println("This is main, goroutine id = ", getg().goid)

	var wg sync.WaitGroup
	n := 42
	wg.Add(n)

	fmt.Println("Spawning some go friends of main...")
	for i := 0; i < n; i++ {
		go func() {
			g := getg()
			fmt.Printf("Goroutine %p, id = %d\n", g, g.goid)
			wg.Done()
		}()
	}

	wg.Wait()
}
