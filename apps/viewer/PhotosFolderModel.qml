import Qt.labs.folderlistmodel 2.1
import "../../pisak/models"


PisakFolderModel {
    rootFolder: pisak.resources.photosDir
    nameFilters: [ "*.jpeg", "*.jpg", "*.png"]
    folder: pisak.resources.photosDir
    sortField: FolderListModel.Name
}
