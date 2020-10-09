/**
 * This file was instantiated from a template with the following substitutions:
 *
 * - CC_NAMESPACE: {PACKAGE_CC_NAMESPACE}
 * - NATIVE_SYMBOL_NAME: {NATIVE_SYMBOL_NAME}
 * - BYTE_TYPE: {BYTE_TYPE}
 * - HEADER_GUARD_DEF_NAME: {HEADER_GUARD_DEF_NAME}
 */

#ifndef {HEADER_GUARD_DEF_NAME}
#define {HEADER_GUARD_DEF_NAME}

extern "C" {BYTE_TYPE} _binary_{NATIVE_SYMBOL_NAME}_start[];
extern "C" {BYTE_TYPE} _binary_{NATIVE_SYMBOL_NAME}_size;
extern "C" {BYTE_TYPE} _binary_{NATIVE_SYMBOL_NAME}_end;

namespace {CC_NAMESPACE} {

inline const {BYTE_TYPE}* start() {
  return _binary_{NATIVE_SYMBOL_NAME}_start;
}

inline size_t size() {
  return (size_t) &_binary_{NATIVE_SYMBOL_NAME}_size;
}

inline const {BYTE_TYPE}* end() {
  return &_binary_{NATIVE_SYMBOL_NAME}_end;
}

}  // namespace {CC_NAMESPACE}

#endif // {HEADER_GUARD_DEF_NAME}
