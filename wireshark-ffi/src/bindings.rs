#![allow(non_upper_case_globals)]
#![allow(non_camel_case_types)]
#![allow(non_snake_case)]

#![allow(warnings)]

include!(concat!(env!("OUT_DIR"), "/bindings.rs"));

// These struct are not thread-safe but we are using it in single-threaded Wireshark
// and this is the only way to tell Rust that you are in charge and you are the one
// to deal with dragons.
unsafe impl Sync for hf_register_info {}
unsafe impl Send for hf_register_info {}

unsafe impl Sync for value_string {}
unsafe impl Send for value_string {}
