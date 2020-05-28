use std::os::raw::c_char;

/// Cast of `&str` to pointer of i8, because `char` is equivalent of signed char
/// in many C implementations
pub(crate) const fn i8_str(s: &str) -> *const c_char {
    s.as_ptr() as *const c_char
}
