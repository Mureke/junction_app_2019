from pyproj import Proj, transform


def conver_espg3067(north, east):
    """
    Converts espg2067 to normal latlan
    :param north:
    :param east:
    :return: [n, e]
    """
    inProj = Proj(init='epsg:3067')
    outProj = Proj(init='epsg:4269')
    x1, y1 = (north, east)
    x2, y2 = transform(inProj, outProj, y1, x1)

    return y2, x2