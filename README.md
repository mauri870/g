# g

Did you know that goroutines have internal IDs? Well, it is quite obvious that they have some sort of identifier, but this is internal to the runtime and is not exposed to normal Go programs.

Hmm, are you sure?

Well, it turns out that with a bit of assembly code, you can inspect the runtime's g structure for the current goroutine and read information from it, including its Go ID!

The runtime uses special Thread-Local-Storage (TLS) to preserve the goroutine pointer across calls. Assembly is used to read the g pointer from the TLS storage (or g register, on some architectures such as arm64). The pointer is then interpreted as a g structure, as defined in [runtime.g](https://github.com/golang/go/blob/b158ca9ae35fd98e383411633469819fdbc65eca/src/runtime/runtime2.go#L422). Since the runtime does not export it, we have to create a dummy one. Then you can read the goid from g as if it were an ordinary struct.

This is just an example, and the code provided here should not be used for anything serious other than learning. It WILL NOT work on 32-bit ports such as 386 or arm, even if you write the proper assembly for it. For brevity, I'm assuming a uintptr is 64 bits. I only have hand-written assembly for amd64, just to showcase how this works.

```bash
# go env -w GOTOOLCHAIN=go1.22.0
GO111MODULE=off go run .
```

Have fun!


