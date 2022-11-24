use std::os::raw::c_int;
/// Main wireshark entry
use wireshark_ffi::bindings::*;
use crate::dissects::dissect_kafka_tcp;
use crate::fields::*;
use crate::utils::i8_str;

#[no_mangle]
#[used]
pub static plugin_version: [u8; 6] = *b"0.0.0\0";

#[no_mangle]
#[used]
pub static plugin_want_major: i32 = 3;

#[no_mangle]
#[used]
pub static plugin_want_minor: i32 = 6;

pub(crate) const KAFKA_PORT: u32 = 9092;
pub(crate) static mut PROTO_KAFKA: i32 = -1;

/// Protocol handler. Registered with wireshark at runtime.
static PLUGIN: proto_plugin = proto_plugin {
    register_protoinfo: Some(proto_register_kafka),
    register_handoff: Some(proto_reg_handoff_kafka),
};

#[no_mangle]
pub extern "C" fn plugin_register() {
    unsafe {
        proto_register_plugin(&PLUGIN);
    }
}

extern "C" fn proto_register_kafka() {
    unsafe {
        PROTO_KAFKA = proto_register_protocol(
            i8_str("Kafka4r\0"),
            i8_str("kafka4r\0"),
            i8_str("kafka4r\0"),
        );

        // Register fields
        let hf_unsafe = HF.as_ptr() as *mut hf_register_info;
        proto_register_field_array(PROTO_KAFKA, hf_unsafe, HF.len() as c_int);

        // Register ett
        let ett = create_ett();
        proto_register_subtree_array(ett.as_ptr(), ett.len() as c_int);
    }
}

extern "C" fn proto_reg_handoff_kafka() {
    unsafe {
        let kafka_handle = create_dissector_handle(Some(dissect_kafka_tcp), PROTO_KAFKA);
        dissector_add_uint(i8_str("tcp.port\0"), KAFKA_PORT, kafka_handle);
    }
}
