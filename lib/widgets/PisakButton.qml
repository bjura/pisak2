import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtGraphicalEffects 1.0
import ".."
import "../style"
import "../scanning"


/*!
    \qmltype PisakButton
    \brief Pisak button base class.

    Represents basic GUI element that can by styled easily.
*/
PisakScanningGroup {
    id: button

    visible: true

    signal clicked()

    property alias text: label.text

    property string iconName: ""

    /*!
        \qmlproperty string PisakButton::styleClass

        Name of the object that can be used by a style sheet to define its style properties.

        The default value is \c "button".
    */
    property string styleClass: "button"

    property int activeBlinkInterval: 200

    function onInputEvent() {}

    function __doSelect() { clicked() }

    function __afterSelect() { unwind(2) }

    Rectangle {
        id: __button
        anchors.fill: parent

        readonly property var __style: PisakStyle.skin[parent.styleClass]

        readonly property var __styleSpec: __style[parent.state]

        color: __styleSpec.background
        radius: __styleSpec.radius
        border.color: __styleSpec.border
        border.width: __styleSpec.borderWidth

        readonly property var __animationStyle: __style["active"].feedbackAnimation

        SequentialAnimation on color {
            loops: Animation.Infinite
            running: button.__activeAnimationRunning

            ColorAnimation {
                from: __button.__animationStyle.backgroundFrom
                to: __button.__animationStyle.backgroundTo
                duration: button.activeBlinkInterval / 2
            }

            ColorAnimation {
                from: __button.__animationStyle.backgroundTo
                to: __button.__animationStyle.backgroundFrom
                duration: button.activeBlinkInterval / 2
            }
        }

        SequentialAnimation on border.color {
            loops: Animation.Infinite
            running: button.__activeAnimationRunning

            ColorAnimation {
                from: __button.__animationStyle.borderFrom
                to: __button.__animationStyle.borderTo
                duration: button.activeBlinkInterval / 2
            }

            ColorAnimation {
                from: __button.__animationStyle.borderTo
                to: __button.__animationStyle.borderFrom
                duration: button.activeBlinkInterval / 2
            }
        }

        SequentialAnimation {
            loops: Animation.Infinite
            running: button.__activeAnimationRunning

            PropertyAnimation {
                targets: [label, iconOverlay]
                property: "color"
                from: __button.__animationStyle.foregroundFrom
                to: __button.__animationStyle.foregroundTo
                duration: button.activeBlinkInterval / 2
            }

            PropertyAnimation {
                targets: [label, iconOverlay]
                property: "color"
                from: __button.__animationStyle.foregroundTo
                to: __button.__animationStyle.foregroundFrom
                duration: button.activeBlinkInterval / 2
            }
        }

        RowLayout {
            spacing: 5
            anchors.fill: parent

            PisakLabel {
                id: label
                Layout.fillHeight: true
                Layout.fillWidth: false
                Layout.alignment: Qt.AlignVCenter | (icon.visible ? Qt.AlignLeft : Qt.AlignHCenter)
                Layout.leftMargin: __button.border.width + 2
                Layout.rightMargin: 1
                Layout.bottomMargin: __button.border.width + 2
                Layout.topMargin: __button.border.width + 2
                color: __button.__styleSpec.foreground
                font.family: __button.__styleSpec.fontFamily
                visible: !(text === "")
            }

            PisakImage {
                id: icon
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter | (label.visible ? Qt.AlignRight : Qt.AlignHCenter)
                Layout.leftMargin: 1
                Layout.rightMargin: __button.border.width + 2
                Layout.bottomMargin: __button.border.width + 2
                Layout.topMargin: __button.border.width + 2
                source: button.iconName ? pisak.resources.getIconPath(button.iconName) : ""
                visible: !(button.iconName === "")

                ColorOverlay {
                    id: iconOverlay
                    anchors.fill: icon
                    source: icon
                    color:  __button.__styleSpec.foreground
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: button.clicked()
        }
    }
}
