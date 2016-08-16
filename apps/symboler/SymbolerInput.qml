import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
import "../../pisak"


ScrollView {
    id: input
    visible: true
    Layout.fillWidth: true
    Layout.minimumHeight: 2 * PisakGlobals.fontPixelSize

    property int symbolWidth: 3 * PisakGlobals.fontPixelSize

    property int symbolHeight: 3 * PisakGlobals.fontPixelSize

    property var __symbols: new Array(0)

    ListView {
        id: __listView
        anchors.fill: parent
        spacing: 2
        orientation: ListView.Horizontal
        highlightFollowsCurrentItem: true
        keyNavigationWraps: false

        model: []

        delegate: symbolDelegate

        Component {
            id: symbolDelegate

            SymbolerTile {
                text: modelData.fileBaseName
                imageSource: modelData.fileURL
                width: input.symbolWidth
                height: input.symbolHeight
            }
        }
    }

    function addSymbol(fileBaseName, fileURL, width, height) {
        __symbols.push({fileBaseName: fileBaseName, fileURL: fileURL})
        __updateView()
    }

    function backspace() {
        __symbols.length = Math.max(__symbols.length - 1, 0)
        __updateView()
    }

    function scrollForward() { __listView.incrementCurrentIndex() }

    function scrollBackward() { __listView.decrementCurrentIndex() }

    function clearAll() {
        __symbols.length = 0
        __updateView()
    }

    function __updateView() {
        __listView.model = __symbols
        __listView.currentIndex = Math.max(__listView.count - 1, 0)
    }
}
