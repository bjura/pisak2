import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
import "../../lib"


ScrollView {
    id: input
    Layout.fillWidth: true
    Layout.minimumHeight: 2 * PisakGlobals.fontPixelSize
    Layout.preferredHeight: 3 * PisakGlobals.fontPixelSize

    property var __symbols: new Array(0)

    ListView {
        anchors.fill: parent
        spacing: 2
        orientation: ListView.Horizontal

        model: input.__symbols

        delegate: SymbolerTile {
            text: modelData.fileBaseName
            imageSource: modelData.fileURL
        }
    }

    function addSymbol(fileBaseName, fileURL) {
        __symbols.push({fileBaseName: fileBaseName, fileURL: fileURL})
    }

    function backspace() {}

    function scrollForward() {}

    function scrollBackward() {}
}
