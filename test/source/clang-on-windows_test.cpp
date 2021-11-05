#include "lib.hpp"

auto main() -> int
{
  library lib;

  return lib.name == "clang-on-windows" ? 0 : 1;
}
