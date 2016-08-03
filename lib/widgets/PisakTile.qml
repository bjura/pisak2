import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtGraphicalEffects 1.0
import ".."
import "../style"
import "../scanning"


/*!
    \qmltype PisakTile
    \brief Pisak tile base class.

    Represents basic GUI element that can by styled easily.
*/
PisakScanningGroup {
    id: tile

    visible: true

    signal clicked()

    property alias text: label.text

    property alias imageSource: image.source

    /*!
        \qmlproperty string PisakTile::styleClass

        Name of the object that can be used by a style sheet to define its style properties.

        The default value is \c "tile".
    */
    property string styleClass: "tile"

    function onInputEvent() {}

    function __doSelect() { clicked() }

    function __afterSelect() { unwind(2) }

    Rectangle {
        id: __tile
        anchors.fill: parent

        readonly property var __style: PisakStyle.skin[parent.styleClass]

        readonly property var __styleSpec: __style[parent.state]

        color: __styleSpec.background
        radius: __styleSpec.radius
        border.color: __styleSpec.border
        border.width: __styleSpec.borderWidth

        ColumnLayout {
            spacing: 5
            anchors.fill: parent

            PisakImage {
                id: image
                Layout.fillHeight: true
                Layout.fillWidth: !label.visible
                Layout.alignment: Qt.AlignHCenter | (label.visible ? Qt.AlignTop : Qt.AlignVCenter)
                Layout.leftMargin: __tile.border.width + 5
                Layout.rightMargin: __tile.border.width + 5
                Layout.bottomMargin: label.visible ? 1 : __tile.border.width + 5
                Layout.topMargin: __tile.border.width + 5
                visible: !(source === "")

                ColorOverlay {
                    id: imageOverlay
                    anchors.fill: image
                    source: image
                    color:  __tile.__styleSpec.foreground
                }
            }

            PisakLabel {
                id: label
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | (image.visible ? Qt.AlignBottom : Qt.AlignVCenter)
                Layout.leftMargin: __tile.border.width + 2
                Layout.rightMargin: __tile.border.width + 2
                Layout.bottomMargin: __tile.border.width + 2
                Layout.topMargin: image.visible ? 1 : __tile.border.width + 2
                color: __tile.__styleSpec.foreground
                font.family: __tile.__styleSpec.fontFamily
                visible: !(text === "")
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: tile.clicked()
        }
    }
}
