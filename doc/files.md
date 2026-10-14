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
