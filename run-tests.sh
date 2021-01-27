#!/usr/bin/env bash 

result=$(nix-shell fixtures/test-shell.nix --run sayhi)

[[ $result == "hello" ]]; echo $?