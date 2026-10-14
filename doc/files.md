# generic cross-C++ project file tree

```sh
mkdir {.vscode,bin,doc,lib,inc,src,tmp,ref}
touch {.vscode,bin,doc,lib,inc,src,tmp,ref,.}/.gitignore
```
```sh
echo '*' > bin/.gitignore
echo '*' > tmp/.gitignore
echo '*' > ref/.gitignore
```
```sh
touch .vscode/extensions.json
touch .vscode/settings.json
touch .vscode/tasks.json
touch .vscode/launch.json
touch .vscode/c_cpp_properties.json
```

## Generic project

```
.vscode/        project-local config for VSCode IDE
vscode/         VSCode extension for bytecode-based projects (syntax,debug,..)
bin/            target for for executable binaries/firmware images
doc/            Obsidian vault (Wiki-like docs)
    html/       Doxygen-generated project reference
lib/            portable libraries
    vm/         platform-independent VM parts
inc/
                project-specific headers
src/
                project-specific source code
tmp/
ref/
```

## [[cross]]-C++ subtree

## build scripts

### GNU [[make]]
### [[CMake]]
