# Visual Studio Code configuration

## Enable synchronization

```shell
$ rm -rf ~/Library/Application\ Support/Code/User
$ ln -s /path/to/vscode/User ~/Library/Application\ Support/Code/User
```

for Windows:

```shell
> mklink /D C:\Users\<username>\AppData\Roaming\Code\User <path>\<to>\User_windows
```
