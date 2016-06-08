pragma Singleton
import QtQuick 2.5


QtObject {
    property QtObject pisakButton: QtObject {
        property QtObject rest: QtObject {
            property color background: "red"
            property color foreground: "black"
            property color border: "blue"
            property int radius: 10
            property int borderWidth: 5
            property string fontFamily: "Helvetica"
            property int fontPixelSize: 15
        }
        property QtObject hover: QtObject {
            property color background: "red"
            property color border: "green"
            property color foreground: "black"
            property int radius: 10
            property int borderWidth: 5
            property string fontFamily: "Helvetica"
            property int fontPixelSize: 15
        }
        property QtObject scanningHilite: QtObject {
            property color background: "red"
            property color border: "blue"
            property color foreground: "black"
            property int radius: 10
            property int borderWidth: 5
            property string fontFamily: "Helvetica"
            property int fontPixelSize: 15
        }
    }
}
