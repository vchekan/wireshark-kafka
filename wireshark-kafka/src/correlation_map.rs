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
            let _id = wmem_register_callback(wmem_file_scope(), Some(deallocate), map as *mut c_void);
        } else {
            let map: &mut HashMap<i32,Correlation> = &mut *(data as *mut HashMap<i32,Correlation>);
            map.insert(corr, info);
        }
    }
}

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

unsafe extern "C" fn deallocate(
    arg1: *mut wmem_allocator_t,
    arg2: wmem_cb_event_t,
    arg3: *mut ::std::os::raw::c_void,
) -> gboolean {
    match arg2 {
        _wmem_cb_event_t_WMEM_CB_FREE_EVENT => println!("Event: WMEM_CB_FREE_EVENT"),
        _wmem_cb_event_t_WMEM_CB_DESTROY_EVENT => println!("Event: WMEM_CB_DESTROY_EVENT"),
        _ => println!("Event: unknown {}", arg2),
    }

    let map: *mut HashMap<i32,Correlation> = (arg3 as *mut HashMap<i32,Correlation>);
    dbg!(map);
    if map != 0 as *mut HashMap<i32,Correlation> {
        map.drop_in_place();
    }

    0 as gboolean  // FALSE: Unregister hook
}