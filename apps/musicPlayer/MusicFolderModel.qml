import Qt.labs.folderlistmodel 2.1
import "../../pisak/models"


PisakFolderModel {
    rootFolder: pisak.resources.musicDir
    nameFilters: [ "*.mp3", "*.ogg" ]
    folder: pisak.resources.musicDir
    sortField: FolderListModel.Name
}
