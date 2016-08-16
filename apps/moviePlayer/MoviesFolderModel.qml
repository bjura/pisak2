import Qt.labs.folderlistmodel 2.1
import "../../pisak/models"


PisakFolderModel {
    rootFolder: pisak.resources.moviesDir
    nameFilters: [ "*.avi", "*.mpeg", "*.ogg" ]
    folder: pisak.resources.moviesDir
    sortField: FolderListModel.Name
}
