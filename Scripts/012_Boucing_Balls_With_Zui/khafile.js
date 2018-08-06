let project = new Project('012_Boucing_Balls_With_Zui');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('zui');
resolve(project);
