"""
Prediction module. Uses Pressagio as an engine.
"""
import platform

import pressagio.callback
import pressagio

try:
    import configparser
except ImportError:
    import ConfigParser as configparser


_configParser = configparser.ConfigParser()

_configParser.read('config.ini')

_configParser['Database']['database'] = 'n_grams.sqlite'


def getPredictions(string):
    """
    Get prediction for the given string.

    :param string: some string.

    :return: list of predictions, as strings.
    """
    callback = __CallbackClass(string)
    predictions = pressagio.Pressagio(callback, _configParser).predict()
    if string.rstrip().split()[-1][0].isupper() and string[-1] != ' ':  # capital letters are handled here
        predictions = [p[0].upper() + p[1:] for p in predictions]
    if string in predictions:
        predictions.remove(string)
    return predictions


class __CallbackClass(pressagio.callback.Callback):

    def __init__(self, buffer):
        super().__init__()
        if platform.linux_distribution()[0] == 'Ubuntu':  # temporary fix
            self.buffer = ' ' + buffer
        else:	
            self.buffer = buffer

    def past_stream(self):
        return self.buffer

    def future_stream(self):
        return ''
