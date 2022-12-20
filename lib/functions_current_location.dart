bool thoolAralDirection(double thoolAralDecimal) {
  if (thoolAralDecimal >= 0) {
    const thoolEastAralNorth = true;
    return thoolEastAralNorth;
  } else {
    const thoolEastAralNorth = false;
    return thoolEastAralNorth;
  }
}

double convertNegativeintoPositive(double coodinate) {
  if (coodinate < 0) {
    final convertedCoordinate = (coodinate).abs();
    return convertedCoordinate;
  } else {
    return coodinate;
  }
}


