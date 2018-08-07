# Compiler un projet

Pour compiler un projet, aller dans le dossier de votre projet, ici 006_Try_To_Build

```
cd C:\Users\Me\Documents\GitHub\Kha-Tutorial\Scripts\006_Try_To_Build
```

Puis lancer la commmande de compilation en spécifiant la plateforme [html5, flash, osx, windows, linux, node, ...]

```
node <khaPath\make> <platform>
Windows => node C:\HaxeToolkit\haxe\lib\kha\git\make html5
Mac     => node /usr/local/lib/haxe/lib/kha/git/make html5
```

Pour compiler le projet directement sur votre plateforme (osx, windows, etc...)
```
node <khaPath\make> --compile
Windows => node C:\HaxeToolkit\haxe\lib\kha\git\make --compile
Mac     => node /usr/local/lib/haxe/lib/kha/git/make --compile
```

### Liens
- https://www.youtube.com/watch?v=hLhKzmNcT2Q
- https://github.com/Kode/Kha/wiki/Examples

