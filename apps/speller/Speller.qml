import QtQuick 2.5
import QtQuick.Layouts 1.2
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
        elements: [mainMenuScanningGroup, keyboard.mainScanningGroup]
    }

    PisakScanningGroup {
        id: mainMenuScanningGroup
        elements: mainMenu.children
    }

    RowLayout {
        anchors.fill: parent

        ColumnLayout {
            id: mainMenu

            SpellerButton {
                id: buttonClearAll
                text: qsTr("WYCZYŚĆ")
                onClicked: textArea.clearAll()
            }

            SpellerButton {
                id: buttonBackspace
                text: qsTr("SKASUJ OSTATNI")
                onClicked: textArea.backspace()
            }

            SpellerButton {
                id: buttonNewLine
                text: qsTr("ENTER")
                onClicked: textArea.newLine()
            }

            SpellerButton {
                id: buttonCursorForward
                text: qsTr("DO PRZODU")
                onClicked: textArea.cursorForward()
            }

            SpellerButton {
                id: buttonCursorBackward
                text: qsTr("DO TYŁU")
                onClicked: textArea.cursorBackward()
            }

            SpellerButton {
                id: buttonUndo
                text: qsTr("COFNIJ")
                onClicked: textArea.undo()
            }

            SpellerButton {
                id: buttonGoToKeyboard
                text: qsTr("KLAWIATURA")
                onClicked: scanningController.goToGroup(keyboardScanningGroup)
            }

            SpellerButton {
                id: buttonSpecial1CharSet
                text: qsTr("ZNAKI SPECJALNE")
                onClicked: keyboard.special1CharSet()
            }

            SpellerButton {
                id: buttonDefaultCharSet
                text: qsTr("ZWYKŁE ZNAKI")
                onClicked: keyboard.defaultCharSet()
            }

            SpellerButton {
                id: buttonExit
                text: qsTr("WYJŚCIE")
                onClicked: main.exitApp()
            }
        }

        ColumnLayout {
            id: inputArea

            SpellerTextArea {
                id: textArea
                width: main.width * 0.6
                height: main.height * 0.5
                charSets: []
            }

            SpellerKeyboard {
                id: keyboard

                SpellerKey {
                    id: key1
                    textDefault: qsTr("Q")
                    target: textArea
                }

                SpellerKey {
                    id: key2
                    textDefault: qsTr("W")
                    target: textArea
                }

                SpellerKey {
                    id: key3
                    textDefault: qsTr("E")
                    target: textArea
                }

                SpellerKey {
                    id: key4
                    textDefault: qsTr("R")
                    target: textArea
                }

                SpellerKey {
                    id: key5
                    textDefault: qsTr("T")
                    target: textArea
                }

                SpellerKey {
                    id: key6
                    textDefault: qsTr("Y")
                    target: textArea
                }

                SpellerKey {
                    id: key7
                    textDefault: qsTr("U")
                    target: textArea
                }

                SpellerKey {
                    id: key8
                    textDefault: qsTr("I")
                    target: textArea
                }

                SpellerKey {
                    id: key9
                    textDefault: qsTr("O")
                    target: textArea
                }

                SpellerKey {
                    id: key10
                    textDefault: qsTr("P")
                    target: textArea
                }

                SpellerKey {
                    id: key11
                    textDefault: qsTr("A")
                    target: textArea
                }

                SpellerKey {
                    id: key12
                    textDefault: qsTr("S")
                    target: textArea
                }

                SpellerKey {
                    id: key13
                    textDefault: qsTr("D")
                    target: textArea
                }

                SpellerKey {
                    id: key14
                    textDefault: qsTr("F")
                    target: textArea
                }

                SpellerKey {
                    id: key15
                    textDefault: qsTr("G")
                    target: textArea
                }

                SpellerKey {
                    id: key16
                    textDefault: qsTr("H")
                    target: textArea
                }

                SpellerKey {
                    id: key17
                    textDefault: qsTr("J")
                    target: textArea
                }

                SpellerKey {
                    id: key18
                    textDefault: qsTr("K")
                    target: textArea
                }

                SpellerKey {
                    id: key19
                    textDefault: qsTr("L")
                    target: textArea
                }

                SpellerKey {
                    id: key20
                    textDefault: qsTr("Z")
                    target: textArea
                }

                SpellerKey {
                    id: key21
                    textDefault: qsTr("X")
                    target: textArea
                }

                SpellerKey {
                    id: key22
                    textDefault: qsTr("C")
                    target: textArea
                }

                SpellerKey {
                    id: key23
                    textDefault: qsTr("V")
                    target: textArea
                }

                SpellerKey {
                    id: key24
                    textDefault: qsTr("B")
                    target: textArea
                }

                SpellerKey {
                    id: key25
                    textDefault: qsTr("N")
                    target: textArea
                }

                SpellerKey {
                    id: key26
                    textDefault: qsTr("M")
                    target: textArea
                }
            }
        }
    }
}
