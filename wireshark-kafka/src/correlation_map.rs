use wireshark_ffi::bindings::*;
use crate::plugin::PROTO_KAFKA;
use std::collections::HashMap;
use crate::dissects::Correlation;
use std::os::raw::c_void;

pub(crate) fn insert_correlation(conversation: *mut conversation_t, corr: i32, info: Correlation) {
    unsafe {
        let mut data = conversation_get_proto_data(conversation, *PROTO_KAFKA.lock().unwrap());
        if data == 0 as *mut c_void {
            let mut map = HashMap::<i32,Correlation>::new();
            map.insert(corr, info);
            let map = Box::into_raw(Box::new(map));
            conversation_add_proto_data(conversation, *PROTO_KAFKA.lock().unwrap(), map as *mut c_void);
            //wmem_register_callback(wmem_file_scope())
        } else {
            let map: &mut HashMap<i32,Correlation> = &mut *(data as *mut HashMap<i32,Correlation>);
            map.insert(corr, info);
        }
    }
}

// Use `'static` because we can not connect to Wireshark's C garbage collector, basically as
// (un)safe as C code would be.
pub(crate) fn find_correlation(conversation: *mut conversation_t, corr: i32) -> Option<&'static Correlation> {
    unsafe {
        let mut data = conversation_get_proto_data(conversation, *PROTO_KAFKA.lock().unwrap());
        if data == 0 as *mut c_void {
            unimplemented!();
        } else {
            let map: &mut HashMap<i32,Correlation> = &mut *(data as *mut HashMap<i32,Correlation>);
            map.get(&corr)
        }
    }
}