pragma Singleton
import QtQuick 2.5
import "defaultSkin.js" as DefaultSkin


QtObject {
    property var skin: __pickSkin()

    function __pickSkin() {
        // TODO: load proper skin dynamically
        switch (pisak.settings.skin) {
            case "default":
            default:
                return DefaultSkin.style
        }
    }
}
