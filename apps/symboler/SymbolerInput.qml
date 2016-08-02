import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4


ScrollView {
    Layout.fillWidth: true

    ListView {
        anchors.fill: parent
        spacing: 2
        orientation: ListView.Horizontal

        model: __symbols

        delegate: SymbolerTile {}

        property var __symbols: new Array(0)
    }

    function typeSymbol(symbol) {}

    function backspace() {}

    function scrollForward() {}

    function scrollBackward() {}
}
