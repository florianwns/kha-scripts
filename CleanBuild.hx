import haxe.io.Path;
import sys.FileSystem;

// Petite classe pour nettoyer les fichier de build
// $ haxe -main CleanBuild --interp
class CleanBuild {
  static function deleteRecursively(path:String) : Void
  {
    if (!FileSystem.exists(path)){
      return;
    }

    if (FileSystem.isDirectory(path))
    {
      var entries = sys.FileSystem.readDirectory(path);
      for (entry in entries) {
        CleanBuild.deleteRecursively(path + '/' + entry);
      }
      FileSystem.deleteDirectory(path);
    }
    else
    {
      FileSystem.deleteFile(path);      
    }
  }

  public static function main(){
    try {
      var root = "Scripts";
      var files = ["korefile.js","build"];
      for(folder in FileSystem.readDirectory(root)){
        for(file in files){
          var path = FileSystem.absolutePath(root + '/' + folder + '/' + file);
          if(!FileSystem.exists(path)) continue;
          CleanBuild.deleteRecursively(path);
        }
      }
    } catch( msg : String ) {
        trace("Error : " + msg);
    }
  }
}