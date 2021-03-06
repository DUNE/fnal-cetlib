#include "cetlib/PluginFactory.h"

#include "cetlib/detail/wrapLibraryManagerException.h"
#include "cetlib/exception.h"

#include <string>

cet::PluginFactory::
PluginFactory(std::string const & suffix)
  :
  lm_(suffix),
  releaseVersionString_(),
  releaseVersionFunc_()
{
}

std::string
cet::PluginFactory::
releaseVersion_()
{
  std::string result;
  if (releaseVersionFunc_) {
    result = releaseVersionFunc_();
  } else {
    result = releaseVersionString_.empty() ?
             "Unknown" :
             releaseVersionString_;
  }
  return result;
}
