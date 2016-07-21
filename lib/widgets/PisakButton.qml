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

        SequentialAnimation on color {
            id: __animation
            loops: Animation.Infinite
            running: button.__activeAnimationRunning

            readonly property var __style: __button.__style["active"].feedbackAnimation

            ColorAnimation {
                from: __animation.__style.colorFrom
                to: __animation.__style.colorTo
                duration: button.activeBlinkInterval / 2
            }

            ColorAnimation {
                from: __animation.__style.colorTo
                to: __animation.__style.colorFrom
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
