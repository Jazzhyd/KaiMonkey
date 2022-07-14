from robot.api.deco import library
from robot.api.deco import keyword


@library(scope='GLOBAL')
class APIAppToken:
    APIApplicationId: str = None
    Secret: str = None

    @keyword
    def test(self):
        print("Test")