import "../../lib"


PisakScrollView {
    cellWidth: 5 * PisakGlobals.fontPixelSize
    cellHeight: 5 * PisakGlobals.fontPixelSize

    model: SymbolerFolderModel {}

    delegate: SymbolerTile {}
}
