"""
Package designates a directory for resources.
"""
import os.path

"""
Absolute path to the package directory.
"""
PATH = os.path.abspath(os.path.dirname(__file__))


def getRes(relative):
    """
    Get absolute resource path from relative resource.
    """
    return os.path.join(PATH, relative)
