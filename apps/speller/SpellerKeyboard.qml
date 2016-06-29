import QtQuick 2.5
import QtQuick.Layouts 1.2
import "../../lib/scanning"


GridLayout {
    id: keyboard
    columns: 7
    rows: 4

    rowSpacing: 5
    columnSpacing: rowSpacing

    property SpellerTextArea textArea: ({})

    property string charSet: "default"

    property var charSets: {"default": [["q", "w", "e", "r", "t", "y", "u"],
                                        ["i", "o", "p", "a", "s", "d", "f"],
                                        ["g", "h", "j", "k", "l", "z", "x"],
                                        [".", " ", "c", "v", "b", "n", "m"]]}

    property var __currentCharSet: charSets[charSet]

    property var __scanningGroups: new Array(0)

    PisakScanningGroup {
        id: mainScanningGroup
        elements: []
    }

    Repeater {
        model: rows
        PisakScanningGroup {
            id: group
            Component.onCompleted: keyboard.__scanningGroups.push(group)
        }
    }

    Repeater {
        model: rows*columns
        SpellerKey {
            id: key
            text: __currentCharSet[Math.floor(index / keyboard.columns)][index % keyboard.columns]
            onClicked: keyboard.textArea.typeText(text)
            Component.onCompleted: keyboard.__scanningGroups[Math.floor(index / keyboard.columns)].elements.push(key)
        }
    }

    function upperCase() {}

    function lowerCase() {}

    function altGr() {}
}
