import QtQml 2.2
import QtQuick.Layouts 1.3
import "../../lib"
import "../../lib/widgets"
import "../../lib/scanning"


PisakApplication {
    id: main
    anchors.fill: parent

    PisakScanningController {
        id: scanningController
        mainGroup: mainScanningGroup
    }

    PisakScanningGroup {
        id: mainScanningGroup
        elements: [mainMenuScanningGroup, keyboardScanningGroup]
    }

    PisakScanningGroup {
        id: mainMenuScanningGroup
        elements: [buttonClearAll, buttonUndo, buttonGoToKeyboard, buttonExit]
    }

    PisakScanningGroup {
        id: keyboardScanningGroup
        elements: [keyboardGroup1ScanningGroup, keyboardGroup1ScanningGroup]
    }

    PisakScanningGroup {
        id: keyboardGroup1ScanningGroup
        elements: [buttonKeyboard1, buttonKeyboard2, buttonKeyboard3, buttonKeyboard4, buttonKeyboard5]
    }

    PisakScanningGroup {
        id: keyboardGroup2ScanningGroup
        elements: [buttonKeyboard6, buttonKeyboard7, buttonKeyboard8, buttonKeyboard9]
    }

    StackLayout {
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent

            RowLayout {
                id: mainMenu

                PisakButton {
                    id: buttonClearAll
                    text: qsTr("WYCZYŚĆ")
                    onClicked: textArea.clearAll()
                }

                PisakButton {
                    id: buttonUndo
                    text: qsTr("COFNIJ")
                    onClicked: textArea.undo()
                }

                PisakButton {
                    id: buttonGoToKeyboard
                    text: qsTr("KLAWIATURA")
                    onClicked: scanningController.goToGroup(keyboardScanningGroup)
                }

                PisakButton {
                    id: buttonExit
                    text: qsTr("WYJŚCIE")
                    onClicked: main.exitApp()
                }
            }

            RowLayout {
                id: inputArea

                PisakTextArea {
                    id: textArea
                    width: main.width * 0.6
                    height: main.height * 0.5
                }

                SpellerKeyboard {
                    id: keyboard

                    SpellerKey {
                        id: buttonKeyboard1
                        text: qsTr("Q")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard2
                        text: qsTr("W")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard3
                        text: qsTr("E")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard4
                        text: qsTr("R")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard5
                        text: qsTr("T")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard6
                        text: qsTr("Y")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard7
                        text: qsTr("U")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard8
                        text: qsTr("I")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard9
                        text: qsTr("O")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard10
                        text: qsTr("P")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard11
                        text: qsTr("A")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard12
                        text: qsTr("S")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard13
                        text: qsTr("D")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard14
                        text: qsTr("F")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard15
                        text: qsTr("G")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard16
                        text: qsTr("H")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard17
                        text: qsTr("J")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard18
                        text: qsTr("K")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard19
                        text: qsTr("L")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard20
                        text: qsTr("Z")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard21
                        text: qsTr("X")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard22
                        text: qsTr("C")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard23
                        text: qsTr("V")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard24
                        text: qsTr("B")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard25
                        text: qsTr("N")
                        target: textArea
                    }

                    SpellerKey {
                        id: buttonKeyboard26
                        text: qsTr("M")
                        target: textArea
                    }
                }
            }
        }
    }
}
