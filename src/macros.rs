
macro_rules! header_fields {
    ( $nn:expr; $($attrs:tt),* ) => {
        // Declare
        $(header_field_declare!($attrs);)*
        // Register
        pub(crate) static mut HF: [hf_register_info; 189] = [ $(header_field_register!($attrs),)* ];
    };
}

macro_rules! header_field_declare {
    // String
    ( { $hf:ident, $name:tt, $abbrev:tt, $blurb:tt } ) => {
        pub(crate) static mut $hf: ApiInitialized<i32> = ApiInitialized::new(-1);
    };

    // Ints
    ( { $hf:ident, $name:expr, $abbrev:expr, $type_:ident $(|$display:ident)?, $blurb:expr $(, $enum:ident)? } ) => {
        pub(crate) static mut $hf: ApiInitialized<i32> = ApiInitialized::new(-1);
    };

    // Raw field declaration
    ( { $hf:ident $decl:tt} ) => {
        pub(crate) static mut $hf: ApiInitialized<i32> = ApiInitialized::new(-1);
    };
}

macro_rules! _resolve_strings {
    () => { std::ptr::null::<c_void>() };
    ($strings:ident) => {$strings.as_ptr() as *const c_void};
}

macro_rules! _resolve_display {
    () => { field_display_e_BASE_DEC as i32 };
    ($display:ident) => { $display as i32 };
}

macro_rules! header_field_register {
    // String
    ( { $hf:ident, $name:tt, $abbrev:tt, $blurb:expr } ) => {
        hf_register_info {
            p_id: unsafe { $hf.ptr_for_api_init() },
            hfinfo: header_field_info {
                name: i8_str($name),
                abbrev: i8_str($abbrev),
                type_: ftenum_FT_STRING,
                display: field_display_e_BASE_NONE as i32,
                strings: ptr::null::<c_void>(),
                bitmask: 0,
                blurb: _resolve_blurp!($blurb),
                id: -1,
                parent: 0,
                ref_type: hf_ref_type_HF_REF_TYPE_NONE,
                same_name_prev_id: -1,
                same_name_next: ptr::null_mut::<_header_field_info>(),
            }
        }
    };

    // Ints
    ( { $hf:ident, $name:expr, $abbrev:expr, $type_:ident $(| $display:ident)?, $blurb:expr $(, $enum:ident)? } ) => {
        hf_register_info {
            p_id: unsafe { $hf.ptr_for_api_init() },
            hfinfo: header_field_info {
                name: i8_str($name),
                abbrev: i8_str($abbrev),
                type_: $type_,
                display: _resolve_display!($($display)?),
                strings: _resolve_strings!($($enum)?),
                bitmask: 0,
                blurb: _resolve_blurp!($blurb),
                id: -1,
                parent: 0,
                ref_type: hf_ref_type_HF_REF_TYPE_NONE,
                same_name_prev_id: -1,
                same_name_next: ptr::null_mut::<_header_field_info>(),
            }
        }
    };

    // Raw field declaration
    ( { $hf:ident $decl:tt} ) => {
        hf_register_info $decl
    }
}

// TODO: fix this, it always i8_str
macro_rules! _resolve_blurp {
    ( - ) => {0 as *const i8};
    ($s:tt) => {i8_str($s)};
}

macro_rules! ett {
    ($($ett:ident),*) => {
        // Declare
        $(pub(crate) static mut $ett : i32 = -1;)*
        // Registration helper
        pub(crate) fn create_ett() -> Vec<*mut i32> {
            vec![
                $( unsafe {(&mut $ett) as *mut _},)*
            ]
        }
    };
}

macro_rules! dissect_field {
    // i32
    ($tree:ident, $tvb:ident, $pinfo:ident, $offset:ident, $api_version:ident, $f:ident, { $hf:ident : i32 }) => {
        unsafe {proto_tree_add_item($tree, *$hf, $tvb, $offset, 4, ENC_BIG_ENDIAN);}
        $offset += 4;
    };

    // i64
    ($tree:ident, $tvb:ident, $pinfo:ident, $offset:ident, $api_version:ident, $f:ident, { $hf:ident : i64 }) => {
        unsafe {proto_tree_add_item($tree, *$hf, $tvb, $offset, 8, ENC_BIG_ENDIAN);}
        $offset += 8;
    };

    // i16
    ($tree:ident, $tvb:ident, $pinfo:ident, $offset:ident, $api_version:ident, $f:ident, { $hf:ident : i16 }) => {
        unsafe {proto_tree_add_item($tree, *$hf, $tvb, $offset, 2, ENC_BIG_ENDIAN);}
        $offset += 2;
    };

    // u8
    ($tree:ident, $tvb:ident, $pinfo:ident, $offset:ident, $api_version:ident, $f:ident, { $hf:ident : u8 }) => {
        unsafe {proto_tree_add_item($tree, *$hf, $tvb, $offset, 1, ENC_NA);}
        $offset += 1;
    };


    // Bool
    ($tree:ident, $tvb:ident, $pinfo:ident, $offset:ident, $api_version:ident, $f:ident, { $hf:ident : bool }) => {
        unsafe {proto_tree_add_item($tree, *$hf, $tvb, $offset, 1, ENC_NA);}
        $offset += 1;
    };

    // String
    ($tree:ident, $tvb:ident, $pinfo:ident, $offset:ident, $api_version:ident, $f:ident, { $hf:ident : String, $ett:ident }) => {
        unsafe{ $offset = dissect_kafka_string($tree, *$hf, $ett, $tvb, $pinfo, $offset); }
    };

    // Array
    ($tree:ident, $tvb:ident, $pinfo:ident, $offset:ident, $api_version:ident, $f:ident, [$t:ident $ett:ident]) => {
        $offset = {
            let tree = unsafe {proto_tree_add_subtree($tree, $tvb, $offset, -1, $ett, ptr::null_mut::<*mut _>(), i8_str(concat!(stringify!($f),"\0")))};
            dissect_kafka_array($tvb, $pinfo, tree, $offset, $api_version, $t::dissect)
        };
    };

    // Function call
    ($tree:ident, $tvb:ident, $pinfo:ident, $offset:ident, $api_version:ident, $f:ident, { $_fn:ident : fn }) => {
        $offset = $_fn($tree, $tvb, $pinfo, $offset, $api_version);
    };

    // Function call with one argument
    ($tree:ident, $tvb:ident, $pinfo:ident, $offset:ident, $api_version:ident, $f:ident, { $_fn:ident($arg:ident) }) => {
        unsafe { $_fn(*$arg, $tree, $tvb, $pinfo, $offset); }
    };

}

macro_rules! _resolve_version {
    ($api_version:ident, ($from:ident - $to:ident) ) => {
        $api_version >= $from && api_version < $to
    };
    ($api_version:ident, $version:expr) => {
        if $version >= 0 {
            $api_version >= $version
        } else {
            $api_version <= -$version
        }
    };
    () => {true};
}

macro_rules! protocol {
    ($sname:ident => { $( $f:ident $(/$version:tt)? : $tp:tt ),* } ) => {
        pub(crate) struct $sname {}

        impl $sname {
            pub(crate) fn dissect(tvb: *mut tvbuff_t, pinfo: *mut packet_info, tree: *mut proto_tree, mut offset: i32, api_version: i16) -> i32 {
                $(
                    let version_match = _resolve_version!($(api_version, $version)? );
                    if version_match {
                        dissect_field!(tree, tvb, pinfo, offset, api_version, $f, $tp);
                    }
                )*
                offset
            }
        }
    };
}
