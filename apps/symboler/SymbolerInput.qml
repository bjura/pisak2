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
        id: __listView
        anchors.fill: parent
        spacing: 2
        orientation: ListView.Horizontal
        highlightFollowsCurrentItem: true
        keyNavigationWraps: false

        model: input.__symbols

        delegate: SymbolerTile {
            text: modelData.fileBaseName
            imageSource: modelData.fileURL
        }
    }

    function addSymbol(fileBaseName, fileURL) { __symbols.push({fileBaseName: fileBaseName, fileURL: fileURL}) }

    function backspace() { __symbols.length = Math.max(__symbols.length - 1, 0) }

    function scrollForward() { __listView.incrementCurrentIndex() }

    function scrollBackward() { __listView.decrementCurrentIndex() }

    function clearAll() { __symbols.length = 0 }
}
