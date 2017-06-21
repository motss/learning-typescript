#!/bin/sh

clear; printf "Running %s script...\n" "$(basename "$0" .sh)"

has_unused_directories=false
source_directory="temp/"
build_directory="dist/"
directories="node_modules/ $build_directory"

if [ ! -z "$1" ] && [ \( "$1" = "clean" \) ]; then
  for directory in $directories; do
    if [ -d "$directory" ]; then
      printf "\nRemoving %s...\n" "$directory"
      rm -rf "$directory"
      has_unused_directories=true
    fi
  done

  if [ "$has_unused_directories" = "true" ]; then
    printf "\nNothing to clean here.\n"
  fi

  printf "\nClean installing NPM's dependencies...\n"
  npm i
fi

printf "\nBuilding project...\n"
if [ -d "$build_directory" ]; then
  rm -rf $build_directory
fi

if [ ! -z "$2" ] && [ "$2" = "production" ]; then
  printf "\nCompiling for production use...\n"
  npm run ts && BABEL_ENV=build babel $source_directory -d $build_directory
elif [ ! -z "$1" ] && [ "$1" = "production" ]; then
  printf "\nCompiling for production use...\n"
  npm run ts && BABEL_ENV=build babel $source_directory -d $build_directory
else
  npm run ts && BABEL_ENV=default babel $source_directory -d $build_directory
fi

# Remove compiled typescripts.
rm -rf $source_directory

printf "\nDone.\n"
