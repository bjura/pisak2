import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import ".."
import "../style"
import "../media"
import "../scanning"


Button {
    id: button
    text: qsTr("Przycisk")
    state: "normal"

    style: ButtonStyle {
        label: PisakLabel {
            text: control.text
            color: __styleSpec.foreground
            font.family: __styleSpec.fontFamily
            font.pixelSize: __styleSpec.fontPixelSize
        }
        background: PisakRectangle {
            color: __styleSpec.background
            radius: __styleSpec.radius
            border.color: __styleSpec.border
            border.width: __styleSpec.borderWidth
        }
    }


    states: [
        State {
          name: "disabled"
        },
        State {
            name: "normal"
        },
        State {
            name: "focus"
        },
        State {
            name: "focusable"
        },
        State {
          name: "active"
        }
    ]

    property string styleClass: "button"
    property url soundName: ""

    readonly property bool isScannable: true
    readonly property string scannableType: "ScannableElement"

    property var parentScanningGroup: ({})

    property var __styleSpec: PisakStyle.skin[styleClass][state]

    PisakSoundEffect {
        id: sound
        source: pisak.resources.getSoundPath(soundName)
    }

    onParentScanningGroupChanged: {
        if (parentScanningGroup.stateChanged !== undefined) {
           parentScanningGroup.stateChanged.connect(
               function(state){ if (state !== "active") { button.state = state } })
       }
    }

    function playSound() {
        sound.play()
    }

    function select() {
        clicked()
    }
}
