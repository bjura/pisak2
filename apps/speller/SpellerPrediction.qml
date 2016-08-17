import QtQuick 2.5
import QtQuick.Layouts 1.2
import Pisak 1.0

import "../../pisak/widgets"


ColumnLayout {
    id: main

    property PisakTextArea target: PisakTextArea {}

    property int buttonCount: 9

    Connections {
        target: main.target
        onTextChanged: __predictor.feed = main.target.text
    }

    PisakPredictor {
        id: __predictor

        property var __defaultPredictions: ["Chciałbym", "Czy", "Jak", "Jestem",
                            "Nie", "Niestety", "Rzeczywiście", "Super", "Witam"]

        property var predictionList: __defaultPredictions

        onPredictionsChanged: predictionList = predictions.split(",")
    }

    Repeater {
        model: buttonCount

        SpellerButton {
            id: button
            text: __predictor.predictionList.length > index ? __predictor.predictionList[index] : ""
            state: text === "" ? "disabled" : "normal"
            onClicked: {
                main.target.text = __predictor.applyPrediction(main.target.text, text)
                main.target.cursorPosition = target.length
            }
        }
    }
}
