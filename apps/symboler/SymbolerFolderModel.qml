import "../../lib/models"
import Qt.labs.folderlistmodel 2.1


PisakFolderModel {
    rootFolder: pisak.resources.symbolsFolder
    nameFilters: [ "*.png", "*.jpg", "*.svg" ]
    folder: pisak.resources.symbolsFolder
    sortField: FolderListModel.Name
}
