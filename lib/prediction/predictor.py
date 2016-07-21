from PyQt5.QtCore import pyqtProperty, pyqtSignal, QObject, QThread
from PyQt5.QtQml import qmlRegisterType

import engine


class _PredictorThread(QThread):

    output = pyqtSignal(str)

    def __init__(self, feed):
        super().__init__()
        self._feed = feed

    def __del__(self):
        self.wait()

    def run(self):
        self.output.emit(','.join(engine.getPredictions(self._feed)))


class Predictor(QObject):

    predictionsChanged = pyqtSignal(str)

    def __init__(self, parent=None):
        super().__init__(parent)
        self._feed = ''
        self._predictions = ''
        self._worker = None

    @pyqtProperty(str)
    def predictions(self):
        return self._predictions

    @predictions.setter
    def predictions(self, value):
        self._predictions = value
        self.predictionsChanged.emit(value)

    @pyqtProperty(str)
    def feed(self):
        return self._feed

    @feed.setter
    def feed(self, value):
        self._feed = value
        if self._worker is not None:
            self._worker.output.disconnect(self._onNewPredictions)
        self._worker = _PredictorThread(value)
        self._worker.output.connect(self._onNewPredictions)
        self._worker.start()

    def _onNewPredictions(self, predictions):
        self.predictions = predictions


def registerTypes():
    qmlRegisterType(Predictor, 'Pisak', 1, 0, 'PisakPredictor')
