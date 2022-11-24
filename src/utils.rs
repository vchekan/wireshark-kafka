use std::os::raw::c_char;
use wireshark_ffi::bindings::value_string;

/// Cast of `&str` to pointer of i8, because `char` is equivalent of signed char
/// in many C implementations
pub(crate) const fn i8_str(s: &str) -> *const c_char {
    s.as_ptr() as *const c_char
}

pub(crate) const fn to_val_str(v: (i32, &str)) -> value_string {
    value_string {
        value: v.0 as u32,
        strptr: i8_str(v.1)
    }
}
