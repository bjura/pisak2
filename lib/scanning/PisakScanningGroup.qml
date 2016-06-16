import QtQuick 2.5

/*!
    \qmltype PisakScanningGroup
    \brief Single scanning group that can contain multiple elements

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

    /*!
        \qmlproperty var PisakScanningGroup::elements

        List containing elements belonging to the group. Each element must be scannable.

        The default value is the empty list.

        \sa isScannable
    */
    property var elements: []

    /*!
        \qmlproperty PisakScanningGroup PisakScanningGroup::parentScanningGroup

        Group that the given group belongs to as one of its elements.

        The default value is \c null.
    */
    property var parentScanningGroup: ({})

    /*!
        \qmlproperty PisakScanningStrategy PisakScanningGroup::strategy

        Strategy that manages the whole scanning cycle within the group.

        The default value is \c PisakScanningStrategyBasic.
    */
    property PisakScanningStrategy strategy: PisakScanningStrategyBasic { group: main }

    /*!
        \qmlproperty bool PisakScanningGroup::isScannable

        Indicates whether the group can be scanned. This property is read-only.

        The default value is \c true.

        \sa scannableType
    */
    readonly property bool isScannable: true

    /*!
        \qmlproperty string PisakScanningGroup::scannableType

        Indicates type of a scannable object. This property is read-only.

        The default value is \c "ScanningGroup".

        \sa isScannable
    */
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
