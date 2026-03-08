#include "gigasecond.h"
#include <math.h>

ptime gigasecond::advance(ptime time) {
  return time + seconds(static_cast<int>(pow(10,9)));
}
