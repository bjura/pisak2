import QtQuick 2.5
import QtQuick.Controls 1.4
import "scanning"


PisakScanningGroup {
    id: main
    visible: true

    strategy: PisakScanningStrategy {
        group: main
    }

    property alias model: __layoutView.model
    property alias delegate: __layoutView.delegate
    property alias cellWidth: __layoutView.cellWidth
    property alias cellHeight: __layoutView.cellHeight

    property int columns: 4
    property int rows: 3

    property var __scanningGroups: new Array(0)

    Repeater {
        model: __layoutView.currentItems

        PisakScanningGroup {
            id: group
            elements: modelData

            Component.onCompleted: __scanningGroups.push(group)
        }
    }

    ScrollView {
        id: __scrollView
        anchors.fill: parent

        GridView {
            id: __layoutView
            anchors.fill: parent

            cellWidth: width / main.columns
            cellHeight: height / main.rows

            property var currentItems: []

            readonly property int visibleItemCount: main.columns * main.rows

            readonly property int itemPerGroupCount: flow === GridView.FlowLeftToRight ? main.columns : main.rows

            readonly property int visibleGroupCount: flow === GridView.FlowLeftToRight ? main.rows : main.columns

            onVisibleItemCountChanged: __updateGroups()
            onItemPerGroupCountChanged: __updateGroups()

            Component.onCompleted: {
                __updateGroups()
            }

            onMovementEnded: main.__onMovementEnded()

            onMovementStarted: main.__onMovementStarted()

            function updateCurrentItems() {
                var groups = new Array(0)
                for(var i = 0; i < visibleGroupCount; i++) {
                    var group = new Array(0)
                    for(var j = 0; j < itemPerGroupCount; j++) {
                        var idx = i * itemPerGroupCount + j
                        group.push(contentItem.children[idx])
                    }
                    groups.push(group)
                }
                currentItems = groups
            }
        }
    }

    Component.onCompleted: {
        __updateGroups()
    }

    function runAutomatic() {}

    function scrollForward() {
        __layoutView.currentIndex = (__layoutView.currentIndex + __layoutView.visibleItemCount) % __layoutView.count
    }

    function scrollBackward() {}

    function moveToEnd() { __layoutView.positionViewAtEnd() }

    function moveToBeginning() { __layoutView.positionViewAtBeginning() }

    function moveToItem(itemIndex) { __layoutView.positionViewAtIndex(itemIndex, GridView.Beginning) }

    function __updateGroups() {
        __scanningGroups = new Array(0)
        __layoutView.updateCurrentItems()
        elements = __scanningGroups
    }

    function __clearGroups() {
        elements = new Array(0)
    }

    function __onMovementStarted() { __clearGroups() }

    function __onMovementEnded() { __updateGroups() }
}
