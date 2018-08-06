let project = new Project('015_Shader');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addShaders('Shaders/**');
resolve(project);
