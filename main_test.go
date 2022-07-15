package main

import "testing"

func TestMyFunc(t *testing.T) {
	MyFunc()
	t.Errorf("this pr is buggy")
}
