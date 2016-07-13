import QtQuick 2.5
import QtQuick.Layouts 1.2
import "../../lib/scanning"


ColumnLayout {
    id: keyboard
    spacing: 5

    property SpellerTextArea textArea: ({})

    property PisakScanningGroup menuGroup: null

    readonly property PisakScanningGroup mainScanningGroup: __mainScanningGroup

    property var defaultCharSet: [["q", "w", "e", "r", "t", "y", "u"],
                                    ["i", "o", "p", "a", "s", "d", "f"],
                                    ["g", "h", "j", "k", "l", "z", "x"],
                                    [".", " ", "c", "v", "b", "n", "m"]]

    property var __currentCharSet: defaultCharSet

    property var __keyboardModel: null

    readonly property int rows: __currentCharSet.length

    property var __scanningGroups: new Array(0)

    property var __rows: new Array(0)

    property bool __backToDefaultCharSetScheduled: false

    property bool __uppercase: false

    PisakScanningGroup {
        id: __mainScanningGroup
        onUnwindedFromSubgroup: __onBackToMainGroup()
    }

    Repeater {
        model: __keyboardModel

        RowLayout {
            id: row
            Layout.alignment: Qt.AlignHCenter

            property int rowIndex: index

            Repeater {
                model: modelData

                SpellerKey {
                    id: key
                    text: modelData
                    onClicked: { keyboard.__selectKey(key) }
                }
            }

            PisakScanningGroup {
                id: group
                elements: row.children
            }

            Component.onCompleted: {
                if (index === 0) {
                    keyboard.__scanningGroups.push(keyboard.menuGroup)
                }
                keyboard.__rows.push(row)
                keyboard.__scanningGroups.push(group)
            }
        }
    }

    Component.onCompleted: {
        __mainScanningGroup.elements = __scanningGroups
    }

    on__CurrentCharSetChanged: {
        __scanningGroups = new Array(0)
        __rows = new Array(0)
        __keyboardModel = __currentCharSet
        __mainScanningGroup.elements = __scanningGroups
    }

    function setCharSet(newCharSet) {
        __uppercase = false
        if (newCharSet === __currentCharSet) { newCharSet = null }

        if (newCharSet === defaultCharSet) {
            __mainScanningGroup.doInsteadOfUnwind = null
        } else { __mainScanningGroup.doInsteadOfUnwind = function() { setDefaultCharSet() } }
        __currentCharSet = newCharSet || defaultCharSet
    }

    function setDefaultCharSet() {
        setCharSet(defaultCharSet)
    }

    function setUpperCase() {
        if (!__uppercase) {
            setCharSet(__currentCharSet.map(function(row) {
                return row.map(function(x){ return x.toUpperCase() }) }))
            __uppercase = true
        } else {
            setDefaultCharSet()
        }
    }

    function __onBackToMainGroup() {
        if (__backToDefaultCharSetScheduled) {
            __backToDefaultCharSetScheduled = false
            setDefaultCharSet()
        }
    }

    function __selectKey(key) {
        textArea.typeText(key.text)
        if (__currentCharSet !== defaultCharSet) { __backToDefaultCharSetScheduled = true }
    }
}
