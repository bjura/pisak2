import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import ".."
import "../style"
import "../media"
import "../scanning"


/*!
    \qmltype PisakButton
    \brief Pisak button base class.

    Represents basic GUI element that can by styled easily.
*/
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

    /*!
        \qmlproperty string PisakButton::styleClass

        Name of the object that can be used by a style sheet to define its style properties.

        The default value is \c "button".
    */
    property string styleClass: "button"

    /*!
        \qmlproperty string PisakButton::soundName

        Name of a sound effect that should represent the button and be played on demand.

        The default value is \c "".
    */
    property string soundName: ""

    /*!
        \qmlproperty bool PisakButton::isScannable

        Indicates whether the button can be scanned. This property is read-only.

        The default value is \c true.

        \sa scannableType
    */
    readonly property bool isScannable: true

    /*!
        \qmlproperty string PisakButton::scannableType

        Indicates type of a scannable object. This property is read-only.

        The default value is \c "ScanningElement".

        \sa isScannable
    */
    readonly property string scannableType: "ScannableElement"

    /*!
        \qmlproperty PisakScanningGroup PisakButton::parentScanningGroup

        Group that the given button belongs to as one of its elements.

        The default value is \c null.
    */
    property var parentScanningGroup: ({})

    property var __styleSpec: PisakStyle.skin[styleClass][state]

    PisakSoundEffect {
        id: __sound
        source: pisak.resources.getSoundPath(soundName)
    }

    onParentScanningGroupChanged: {
        if (parentScanningGroup.stateChanged !== undefined) {
           parentScanningGroup.stateChanged.connect(
               function(state){ if (state !== "active") { button.state = state } })
       }
    }

    /*!
        \qmlmethod void PisakButton::playSound()

        Plays sound that has been assigned to the button.
    */
    function playSound() {
        __sound.play()
    }

    /*!
        \qmlmethod void PisakButton::select()

        Selects the button - emits the \c clicked signal.
    */
    function select() {
        clicked()
    }
}
