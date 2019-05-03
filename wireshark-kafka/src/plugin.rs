use wireshark_ffi::bindings::*;
use crate::dissects::dissect_kafka_tcp;
use crate::fields::*;
use crate::utils::i8_str;
use lazy_static::lazy_static;
use std::sync::Mutex;
use std::os::raw::{c_char, c_int, c_void};

#[no_mangle]
#[used]
pub static plugin_version: [u8; 6] = *b"0.0.0\0";

#[no_mangle]
#[used]
pub static plugin_release: [u8; 4] = *b"2.6\0";

pub(crate) const KAFKA_PORT: u32 = 9092;
lazy_static! {
    pub(crate) static ref PROTO_KAFKA: Mutex<i32> = Mutex::new(-1);
}

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
        *PROTO_KAFKA.lock().unwrap() = proto_register_protocol(
            i8_str("Kafka4r\0"),
            i8_str("kafka4r\0"),
            i8_str("kafka4r\0"),
        );

        // Register fields
        let mut hf = HF.lock().unwrap();
        hf.append(&mut hf2());
        proto_register_field_array(*PROTO_KAFKA.lock().unwrap(), hf.as_mut_ptr(), hf.len() as i32);

        // Register RecordBatch attributes fields
        //let mut hf = hf2();
        //proto_register_field_array(*PROTO_KAFKA.lock().unwrap(), hf.as_mut_ptr(), hf.len() as i32);

        // Register ett
        let mut ett = create_ett();
        proto_register_subtree_array(ett.as_ptr(), ett.len() as i32);
    }
}

extern "C" fn proto_reg_handoff_kafka() {
    unsafe {
        let kafka_handle = create_dissector_handle(Some(dissect_kafka_tcp), *PROTO_KAFKA.lock().unwrap());
        dissector_add_uint(i8_str("tcp.port\0"), KAFKA_PORT, kafka_handle);
    }
}
