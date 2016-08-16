import QtQuick.Layouts 1.2
import "../../pisak/scanning"
import "../../pisak"


PisakButtonScanningTeleporter {
    Layout.minimumHeight: 2 * PisakGlobals.fontPixelSize
    Layout.minimumWidth: 5 * PisakGlobals.fontPixelSize
    Layout.preferredWidth: 8 * PisakGlobals.fontPixelSize
    Layout.preferredHeight: 3 * PisakGlobals.fontPixelSize
    Layout.fillHeight: false
    Layout.fillWidth: true
}
