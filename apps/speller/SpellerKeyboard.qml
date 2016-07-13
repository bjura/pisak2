import QtQuick 2.5
import QtQuick.Layouts 1.2
import "../../lib/scanning"


ColumnLayout {
    id: keyboard
    spacing: 5

    property SpellerTextArea textArea: ({})

    property PisakScanningGroup menuGroup: null

    readonly property PisakScanningGroup mainScanningGroup: __mainScanningGroup

    property var __defaultCharSet: [["q", "w", "e", "r", "t", "y", "u"],
                                    ["i", "o", "p", "a", "s", "d", "f"],
                                    ["g", "h", "j", "k", "l", "z", "x"],
                                    [".", " ", "c", "v", "b", "n", "m"]]

    property var __currentCharSet: __defaultCharSet

    property var __keyboardModel: null

    readonly property int rows: __currentCharSet.length

    property var __scanningGroups: new Array(0)

    property var __rows: new Array(0)

    on__CurrentCharSetChanged: {
        __scanningGroups = new Array(0)
        __rows = new Array(0)
        __keyboardModel = __currentCharSet
        __mainScanningGroup.elements = __scanningGroups
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

                    onClicked: keyboard.textArea.typeText(text)
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

    PisakScanningGroup {
        id: __mainScanningGroup
    }

    Component.onCompleted: {
        __mainScanningGroup.elements = __scanningGroups
    }

    function changeCharSet(newCharSet) {
        if (newCharSet === __currentCharSet) {
            newCharSet = __defaultCharSet
            __mainScanningGroup.doInsteadOfUnwind = null
        } else {
            __mainScanningGroup.doInsteadOfUnwind = function() { changeCharSet(__defaultCharSet) }
        }
        __currentCharSet = newCharSet
    }

    function upperCase() {}

    function lowerCase() {}

    function altGr() {}
}
