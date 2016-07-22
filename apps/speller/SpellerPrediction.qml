import QtQuick 2.5
import QtQuick.Layouts 1.2
import Pisak 1.0

import "../../lib/widgets"


ColumnLayout {
    Layout.alignment: Qt.AlignVCenter
    spacing: 5

    property PisakTextArea target: null

    property int buttonCount: 8

    PisakPredictor {
        id: __predictor
        feed: target.text

        property var predictionList: predictions.split(",")
    }

    Repeater {
        model: buttonCount
        SpellerButton {
            id: button
            text: __predictor.predictionList.length > index ? __predictor.predictionList[index] : ""
            state: text === "" ? "disabled" : button.state
        }
    }
}
