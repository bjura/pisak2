import QtQuick 2.5
import Qt.labs.folderlistmodel 2.1


FolderListModel {
    showDirsFirst: true
    showDotAndDotDot: true

    // caseSensitive: false  <- from Qt 5.7 this defaults to true (!)

    property var __foldersHistory: new Array(0)

    property int __currentFolderIdx: 0

    Component.onCompleted: __foldersHistory.push(folder)

    function __trimFoldersHistory() {
        if (__foldersHistory.length > __currentFolderIdx + 1) {
            __foldersHistory.splice(__currentFolderIdx + 1,
                                    __foldersHistory.length - (__currentFolderIdx + 1))
        }
    }

    function __goToCurrentFolder() {
        folder = __foldersHistory[__currentFolderIdx]
    }

    function getCurrentFolder() {
        return __foldersHistory[__currentFolderIdx]
    }

    function openNewFolder(newFolder) {
        if (newFolder !== folder) {
            __trimFoldersHistory()
            __foldersHistory.push(newFolder)
            __currentFolderIdx += 1
            __goToCurrentFolder()
        }
    }

    function goToParentFolder() {
        openNewFolder(parentFolder)
    }

    function goToPreviousFolder() {
        if (0 <= __currentFolderIdx - 1 < __foldersHistory.length ) {
            __currentFolderIdx -= 1
            __goToCurrentFolder()
        }
    }

    function goToNextFolder() {
        if (__currentFolderIdx + 1 < __foldersHistory.length) {
            __currentFolderIdx += 1
            __goToCurrentFolder()
        }
    }
}
