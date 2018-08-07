let project = new Project('004_Make_Sounds');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('zui');
resolve(project);
