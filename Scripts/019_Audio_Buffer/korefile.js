let fs = require('fs');
let path = require('path');
let project = new Project('019_Audio_Buffer');
project.targetOptions = {"html5":{},"flash":{},"android":{},"ios":{}};
project.setDebugDir('build/osx');
await project.addProject('build/osx-build');
await project.addProject('/usr/local/lib/haxe/lib/kha/git');
resolve(project);
