# Shell2nix 

A simple script to convert bash shell functions into scripts. 

## Why

Typically, in non nix workflows, you might have - for example - a infrastructure folder with something like `functions.sh` to automate certain tasks. 
To make this nicer with nix, you could create a simple nix shell with a `shellHook` to export your functions / aliases, but one, this doesn't work with direnv/lorri
and two, it forces you to use bash inside your nix-shell - which some more opinioned people might not like (myself included)

## A solution 

So then, what if we take every bash function and turn it into a binary? Well, we can do that simply by wrapping the bash function with bash and putting it in a file for example 

```
#!/usr/bin/env bash
source $file-with-functions
$function-name $args
```

then if we put that file into the path, and name it the same as the function name, then it works just like the original function. Magic! 

And for bonus points, it means that it'll work cross shell, since you can run our function "binary" inside fish for example, since it'll execute 
bash behind the scenes.