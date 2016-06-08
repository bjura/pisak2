import QtQuick 2.5

/*!
    \qmltype PisakScanningGroup
    \brief Single scanning group that can consist of multiple elements

    Groups together elements that are somehow related to each other or have
    something in common (but not necessarily are placed next to each other in the graphical layout)
    and should be scanned within the same scanning cycle.
*/
Item {
    id: main

    property var elements: []
    property var parentGroup: ({})

    property PisakScanningStrategy strategy: PisakScanningStrategyBasic { group: main }

    property bool scanningHighliteEnabled: true

    readonly property bool isScannable: true
    readonly property string scannableType: "ScanningGroup"

    function beforeSelect() {
        // do something with the elements, for example make them blink
        for(var i = 0; i < elements.length; i++) {
            elements[i].beforeSelect()
        }
    }

    function hoverOn() {
        for(var i = 0; i < elements.length; i++) {
            elements[i].hoverOn()
        }
    }

    function hoverOff() {
        for(var i = 0; i < elements.length; i++) {
            elements[i].hoverOff()
        }
    }

    function scanningHighliteOn() {
        if (scanningHighliteEnabled) {
            for(var i = 0; i < elements.length; i++) {
                elements[i].scanningHighliteOn()
            }
        }
    }

    function scanningHighliteOff() {
        for(var i = 0; i < elements.length; i++) {
            elements[i].scanningHighliteOn()
        }
    }
}
