#!/bin/bash
git ls-remote https://github.com/TheWisker/EMath.git HEAD | grep -e HEAD | sort -u | sed -e 's/\s.*$//'