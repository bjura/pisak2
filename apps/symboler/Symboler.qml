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
            elements: [mainMenuGroup, sideMenuGroup, inputMenuGroup]
        }

        PisakScanningGroup {
            id: mainMenuGroup
            elements: mainMenuPanel.children
        }

        PisakScanningGroup {
            id: sideMenuGroup
            elements: sideMenuPanel.children
        }

        PisakScanningGroup {
            id: inputMenuGroup
            elements: inputMenuPanel.children
        }

        ColumnLayout {
            width: parent.width
            height: parent.height
            spacing: 10

            RowLayout {
                Layout.alignment: Qt.AlignVCenter
                spacing: 2

                SymbolerInput {
                    id: inputPanel
                }

                ColumnLayout {
                    id: inputMenuPanel
                    Layout.alignment: Qt.AlignVCenter
                    spacing: 2

                    SymbolerSquareButton {
                        iconName: "nav_left"
                        onClicked: inputPanel.scrollBackward()
                    }

                    SymbolerSquareButton {
                        iconName: "nav_right"
                        onClicked: inputPanel.scrollForward()
                    }
                }
            }

            RowLayout {

                ColumnLayout {
                    id: mainMenuPanel
                    Layout.alignment: Qt.AlignVCenter
                    spacing: 2

                    RowLayout {
                        spacing: 5
                        Layout.alignment: Qt.AlignHCenter

                        SymbolerLabel {
                            text: qsTr("NARZĘDZIA")
                        }

                        PisakImage {
                            Layout.maximumHeight: 2 * PisakGlobals.fontPixelSize
                            source: pisak.resources.getIconPath("tools")
                        }
                    }

                    SymbolerButtonScanningTeleporter {
                        id: buttonFromMainMenuToPager
                        text: qsTr("LITERY")
                        iconName: "symbols"
                        controller: scanningController
                        targetGroup: sideMenuGroup
                    }

                    SymbolerButton {
                        id: buttonSave
                        text: qsTr("ZAPISZ")
                        iconName: "save"
                        state: "disabled"
                    }

                    SymbolerButton {
                        id: buttonLoad
                        text: qsTr("WCZYTAJ")
                        iconName: "load"
                        state: "disabled"
                    }

                    SymbolerButton {
                        id: buttonClearAll
                        text: qsTr("NOWY")
                        iconName: "doc"
                        onClicked: inputPanel.clearAll()
                    }

                    SymbolerButton {
                        id: buttonSend
                        text: qsTr("WYŚLIJ")
                        iconName: "send"
                        state: "disabled"
                    }

                    SymbolerButton {
                        id: buttonPrint
                        text: qsTr("DRUKUJ")
                        iconName: "print"
                        state: "disabled"
                    }

                    SymbolerButton {
                        id: buttonBack
                        text: qsTr("WRÓĆ")
                        iconName: "back"
                        state: "disabled"
                    }

                    SymbolerButton {
                        id: buttonExit
                        text: qsTr("WYJŚCIE")
                        iconName: "exit"
                        onClicked: app.exitApp()
                    }
                }

                SymbolerPager {
                    id: pager
                    Layout.alignment: Qt.AlignVCenter
                }

                ColumnLayout {
                    id: sideMenuPanel
                    Layout.alignment: Qt.AlignVCenter
                    spacing: 5

                    SymbolerSquareButton {
                        iconName: "loop"
                    }

                    SymbolerSquareButton {
                        iconName: "nav_right"
                    }

                    SymbolerSquareButton {
                        iconName: "nav_left"
                    }

                    SymbolerSquareButtonScanningTeleporter {
                        iconName: "symbols"
                    }

                    SymbolerSquareButton {
                        iconName: "backspace"
                    }

                    SymbolerSquareButton {
                        iconName: "lips"
                    }

                    SymbolerSquareButtonScanningTeleporter {
                        iconName: "tools"
                    }

                    SymbolerSquareButton {
                        iconName: "house"
                    }
                }
            }
        }
    }
}
