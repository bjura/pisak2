import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Window 2.2
import "../../pisak"
import "../../pisak/widgets"
import "../../pisak/scanning"


PisakMainWindow {
    id: main
    visible: true
    width: Screen.width * 0.7
    height: Screen.height * 0.7

    PisakImage {
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: pisak.resources.getResource("fence.png")
    }

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
            elements: [mainMenuGroup]
        }

        PisakScanningGroup {
            id: mainMenuGroup
            elements: mainMenuPanel.children
        }

        ColumnLayout {
            width: parent.width
            height: parent.height
            spacing: 10

            RowLayout {

                ColumnLayout {
                    id: mainMenuPanel
                    Layout.alignment: Qt.AlignVCenter
                    spacing: 2

                    PaintButton {
                        id: buttonExit
                        text: qsTr("WYJŚCIE")
                        iconName: "exit"
                        onClicked: app.exitApp()
                    }
                }

                PaintCanvas {}
            }
        }
    }
}
