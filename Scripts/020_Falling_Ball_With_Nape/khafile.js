let project = new Project('020_Falling_Ball_With_Nape');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('nape');
resolve(project);
