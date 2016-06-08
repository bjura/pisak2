import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import ".."
import "../style"
import "../media"


Button {
    id: button
    text: qsTr("Przycisk")
    state: "rest"

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
            name: "rest"
        },
        State {
            name: "hover"
        },
        State {
            name: "scanningHilite"
        }
    ]

    property string styleClass: "pisakButton"
    property url soundFile: ""

    readonly property bool isScannable: true
    readonly property string scannableType: "ScannableElement"

    property var __styleSpec: PisakStyle[styleClass][state]
    property string __previousState: state

    PisakSoundEffect {
        id: sound
        source: soundFile
    }

    onStateChanged: {
        // TODO: Do something more wise here
        __previousState = state
    }

    function playSound() {
        sound.play()
    }

    function select() {
        clicked()
    }

    function beforeSelect() {
        // do something with the button, for example make it blink
    }

    function hoverOn() {
        state = "hover"
    }

    function hoverOff() {
        // do it more flexible:
        state = "scanningHilite"
    }

    function scanningHiliteOn() {
        state = "scanningHilite"
    }

    function scanningHiliteOff() {
        state = "rest"
    }
}
