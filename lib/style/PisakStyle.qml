pragma Singleton
import QtQuick 2.5


QtObject {
    property QtObject defaults: QtObject {
        property string fontFamily: "Helvetica"
        property int fontPixelSize: 20
    }

    property QtObject button: QtObject {
        property QtObject rest: QtObject {
            property color background: "red"
            property color foreground: "black"
            property color border: "blue"
            property int radius: 10
            property int borderWidth: 5
            property string fontFamily: defaults.fontFamily
            property int fontPixelSize: defaults.fontPixelSize
        }
        property QtObject hover: QtObject {
            property color background: "red"
            property color border: "green"
            property color foreground: "black"
            property int radius: 10
            property int borderWidth: 5
            property string fontFamily: defaults.fontFamily
            property int fontPixelSize: defaults.fontPixelSize
        }
        property QtObject scanningHighlite: QtObject {
            property color background: "red"
            property color border: "blue"
            property color foreground: "black"
            property int radius: 10
            property int borderWidth: 5
            property string fontFamily: defaults.fontFamily
            property int fontPixelSize: defaults.fontPixelSize
        }
    }
}
