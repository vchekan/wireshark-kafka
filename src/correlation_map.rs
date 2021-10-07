/// Kafka response version nor api key is presented in response and is the same as request. In order to decode
/// response with proper api key and version, we need to store what was the request version. This
/// info is stored in HashMap which in turn is stored in wireshark's "conversation" (tcp connection).
///
/// Wireshark implements custom memory allocator. When file is reloaded, all memory in file allocator
/// is zeroed. Plugin should check if user data is null, and if so, "allocate" new data structure
/// in such allocator.
/// Rust potentially can use custom allocator, but it is completly incompatible with "fire and forget"
/// design of wireshark's memory. Solution is to create raw pointer to `*mut HashMap` and register
/// deallocation callback with wireshark runtime.

use std::collections::HashMap;
use std::os::raw::c_void;
use std::ptr;
use wireshark_ffi::bindings::*;
use crate::dissects::Correlation;
use crate::plugin::PROTO_KAFKA;

pub(crate) fn insert_correlation(conversation: *mut conversation_t, corr: i32, info: Correlation) {
    unsafe {
        let data = conversation_get_proto_data(conversation, PROTO_KAFKA);
        if data.is_null() {
            let mut map = HashMap::<i32,Correlation>::new();
            map.insert(corr, info);
            let map = Box::into_raw(Box::new(map));
            conversation_add_proto_data(conversation, PROTO_KAFKA, map as *mut c_void);
            let _id = wmem_register_callback(wmem_file_scope(), Some(deallocate), map as *mut c_void);
        } else {
            let map: &mut HashMap<i32,Correlation> = &mut *(data as *mut HashMap<i32,Correlation>);
            map.insert(corr, info);
        }
    }
}

pub(crate) fn find_correlation(conversation: *mut conversation_t, corr: i32) -> Option<&'static Correlation> {
    unsafe {
        let data = conversation_get_proto_data(conversation, PROTO_KAFKA);
        if data.is_null() {
            //unimplemented!();
            None
        } else {
            let map: &mut HashMap<i32,Correlation> = &mut *(data as *mut HashMap<i32,Correlation>);
            map.get(&corr)
        }
    }
}

unsafe extern "C" fn deallocate(
    _arg1: *mut wmem_allocator_t,
    _arg2: wmem_cb_event_t,
    arg3: *mut ::std::os::raw::c_void,
) -> gboolean {
    if !arg3.is_null() {
        let map: *mut HashMap<i32,Correlation> = arg3 as *mut HashMap<i32,Correlation>;
        map.drop_in_place();
    }

    0  // FALSE: Unregister hook
}