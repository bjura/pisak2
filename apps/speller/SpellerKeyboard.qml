import QtQuick 2.5
import QtQuick.Layouts 1.2
import "../../lib/scanning"


ColumnLayout {
    id: keyboard

    // in case of GridLayout:
    // columns: 5

    property int rows: 4
    property int columns: 10

    property PisakTextArea textArea: ({})

    property string charSet: "default"

    PisakScanningGroup {
        id: mainScanningGroup
        elements: new Array(0)
    }

    property var charSets: {"default": [["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
                                        ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
                                        ["z", "x", "c", "v", "b", "n", "m"]],
                            "special": [["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
                                        [".", ",", ";", "!", "?"]]}

    property var __currentCharSet: charSets[charSet]

    property Array __keys: new Array(0)

    onCharSetChanged: {
        keyboardLoader.sourceComponent = keyboardComponent

        // alternative:
        // set text on each button in a loop over all the buttons
    }

    function upperCase() {}

    function lowerCase() {}

    function altGr() {}

    Loader {
        id: keyboardLoader
    }

    Component {
        id: keyboardComponent
        Repeater {
            model: __currentCharSet.length
            RowLayout {
                id: row
                PisakScanningGroup {
                    id: group
                    elements: row.children
                    Component.onCompleted: mainScanningGroup.push(group)
                }
                Repeater {
                    model: __currentCharSet[index]
                    SpellerKey {
                        id: button
                        text: modelData
                        onClicked: keyboard.textArea.typeText(text)
                        Component.onCompleted: __keys.push(button)
                    }
                }
            }
        }
    }

    // alternative:
    // keyboard must be the GridLayout, and columns prop must be set
    Repeater {
        model: rows*columns
        SpellerKey {
            onClicked: keyboard.textArea.typeText(text)
        }
    }
}
