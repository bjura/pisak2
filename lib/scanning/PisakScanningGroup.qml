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
    state: "normal"

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

    property var elements: []
    property var parentScanningGroup: ({})

    property PisakScanningStrategy strategy: PisakScanningStrategyBasic { group: main }

    readonly property bool isScannable: true
    readonly property string scannableType: "ScanningGroup"

    onParentScanningGroupChanged: {
        if (parentScanningGroup.stateChanged !== undefined) {
           parentScanningGroup.stateChanged.connect(
               function(state){ if (state !== "active") { main.state = state } })
       }
    }

    onElementsChanged: {
        for(var i = 0; i < elements.length; i++) {
            if (!elements[i].isScannable) {
                // elements.splice(i, 1)
            } else { elements[i].parentScanningGroup = main }
        }
    }
}
