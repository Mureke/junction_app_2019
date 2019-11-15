from pyproj import Proj, transform


def convert_espg3067(north, south):
    """
    Converts espg2067 to normal latlan
    :param north:
    :param south:
    :return: [n, s]
    """
    inProj = Proj(init='epsg:3067')
    outProj = Proj(init='epsg:4269')
    x1, y1 = (north, south)
    north, south = transform(inProj, outProj, y1, x1)

    return north, south
