import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Window 2.2
import "../../lib"
import "../../lib/widgets"
import "../../lib/scanning"


PisakMainWindow {
    id: main
    visible: true
    width: Screen.width * 0.7
    height: Screen.height * 0.7

    Component.onCompleted: scanningController.startScanning()

    PisakApplication {
        id: app
        anchors.fill: parent

        onExitApp: main.close()

        PisakScanningController {
            id: scanningController
            mainGroup: mainScanningGroup
        }

        PisakScanningGroup {
            id: mainScanningGroup
            elements: [mainMenuGroup, predictionGroup, keyboard.mainScanningGroup]
        }

        PisakScanningGroup {
            id: mainMenuGroup
            elements: mainMenuPanel.children
        }

        PisakScanningGroup {
            id: predictionGroup
            state: "disabled"
            elements: predictionPanel.children
        }

        PisakScanningGroup {
            id: keyboardMenuGroup
            elements: keyboardMenu.children
        }

        RowLayout {
            width: parent.width
            height: parent.height
            spacing: 5

            ColumnLayout {
                id: mainMenuPanel
                Layout.alignment: Qt.AlignVCenter
                spacing: 5

                SpellerButtonScanningTeleporter {
                    id: buttonFromMainMenuToKeyboard
                    text: qsTr("LITERY")
                    iconName: "keyboard"
                    controller: scanningController
                    targetGroup: keyboard.mainScanningGroup
                }

                SpellerButtonScanningTeleporter {
                    id: buttonFromMainMenuToPrediction
                    text: qsTr("PREDYKCJA")
                    iconName: "prediction"
                    controller: scanningController
                    targetGroup: predictionGroup
                }

                SpellerButton {
                    id: buttonSave
                    text: qsTr("ZAPISZ")
                    iconName: "save"
                    state: "disabled"
                }

                SpellerButton {
                    id: buttonLoad
                    text: qsTr("WCZYTAJ")
                    iconName: "load"
                    state: "disabled"
                }

                SpellerButton {
                    id: buttonRead
                    text: qsTr("PRZECZYTAJ")
                    iconName: "lips"
                    state: "disabled"
                }

                SpellerButton {
                    id: buttonClearAll
                    text: qsTr("NOWY")
                    iconName: "doc"
                    onClicked: textArea.clearAll()
                }

                SpellerButton {
                    id: buttonSend
                    text: qsTr("WYŚLIJ")
                    iconName: "send"
                    state: "disabled"
                }

                SpellerButton {
                    id: buttonPrint
                    text: qsTr("DRUKUJ")
                    iconName: "print"
                    state: "disabled"
                }

                SpellerButton {
                    id: buttonExit
                    text: qsTr("WYJŚCIE")
                    iconName: "exit"
                    onClicked: app.exitApp()
                }
            }

            ColumnLayout {
                id: predictionPanel
                Layout.alignment: Qt.AlignVCenter
                spacing: 5

                Repeater {
                    model: 8
                    SpellerButton {
                        text: qsTr("PREDYKCJA %1").arg(index+1)
                    }
                }
            }

            ColumnLayout {
                id: inputAreaPanel
                Layout.alignment: Qt.AlignVCenter
                spacing: 5

                SpellerTextArea {
                    id: textArea
                    Layout.alignment: Qt.AlignHCenter
                }

                RowLayout {
                    id: keyboardMenu
                    Layout.alignment: Qt.AlignHCenter

                    SpellerSquareButtonScanningTeleporter {
                        id: buttonFromKeyboardToPrediction
                        iconName: "prediction"
                        controller: scanningController
                        targetGroup: predictionGroup
                    }

                    SpellerKey {
                        id: buttonSpace
                        iconName: "space"
                        onClicked: textArea.typeText(" ")
                    }

                    SpellerSquareButton {
                        id: buttonBackspace
                        iconName: "backspace"
                        onClicked: textArea.backspace()
                    }

                    SpellerSquareButton {
                        id: buttonUndo
                        iconName: "undo"
                        onClicked: textArea.undo()
                    }

                    SpellerSquareButton {
                        id: buttonSpecialChars
                        iconName: "face"
                        property var charSet: [["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
                                               [",", ".", ";", ":", "\"", "!", "\\", "&", "?",
                                                {iconName: "nav_up", text: "", onClicked: null, disabled: true}],
                                               ["/", "*", "%", "@", "(", ")", "=",
                                                {iconName: "nav_left", text: "", onClicked: textArea.cursorBackward},
                                                {iconName: "nav_right", text: "", onClicked: textArea.cursorForward},
                                                {iconName: "nav_down", text: "", disabled: true}]]
                        onClicked: keyboard.setCharSet(charSet)
                    }

                    SpellerSquareButton {
                        id: buttonUppercaseChars
                        iconName: "uppercase"
                        onClicked: keyboard.setUpperCase()
                    }

                    SpellerSquareButton {
                        id: buttonPolishChars
                        iconName: "polish"
                        onClicked: keyboard.setPolishChars()
                    }

                    SpellerSquareButton {
                        id: buttonNewLine
                        iconName: "enter"
                        onClicked: textArea.newLine()
                    }

                    SpellerKey {
                        id: buttonSZ
                        text: "SZ"
                        onClicked: textArea.typeText(text)
                    }

                    SpellerSquareButtonScanningTeleporter {
                        id: buttonFromKeyboardToMainMenu
                        iconName: "tools"
                        controller: scanningController
                        targetGroup: mainMenuGroup
                    }
                }

                SpellerKeyboard {
                    id: keyboard
                    textArea: textArea
                    Layout.alignment: Qt.AlignHCenter
                    menuGroup: keyboardMenuGroup
                }
            }
        }
    }
}
