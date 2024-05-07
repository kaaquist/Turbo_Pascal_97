# Turbo Pascal Code snippets
> Create as part of a corse in high school - '97

How do I run this here old code?  
If you are using `linux` like me - then install `fp-compiler`. 

```text
> sudo apt install fpc
```

Then you should be able to compile the code and run it.  
If you want to make a `Hello World`  

```text
> cat <<EOF >> hello_world.pas
program Hello;
begin
  writeln ('Hello, world.');
  readln;
end.
EOF  
```

And then compile it
```text
> fpc hello_world.pas
Free Pascal Compiler version 3.2.2+dfsg-32 [2024/01/05] for x86_64
Copyright (c) 1993-2021 by Florian Klaempfl and others
Target OS: Linux for x86-64
Compiling hello_world.pas
Linking hello_world
4 lines compiled, 0.1 sec
```

Now you can run the code
```text
> ./hello_world
```
Done! Enjoy!