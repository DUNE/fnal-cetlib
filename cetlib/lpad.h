#ifndef LPAD_H
#define LPAD_H

// ======================================================================
//
// lpad: left-pad a string to the wanted size, unless already longer
//
// ======================================================================

#include <string>

namespace cet {
  std::string
    lpad( std::string const &    pad_me
        , std::string::size_type wanted_size
        , char                   char_to_pad_with = ' '
        );
}

#endif
