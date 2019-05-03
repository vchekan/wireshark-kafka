extern crate bindgen;

use std::env;
use std::path::PathBuf;

fn main() {
    println!("cargo:rustc-link-lib=wireshark");
    let bindings = bindgen::Builder::default()
        .header("src/wrapper.h")
        .clang_args(vec![
            "-D",
            "HAVE_PLUGINS",
            "-I",
            "/usr/include/wireshark",
            "-I",
            "/usr/include/glib-2.0",
            "-I",
            "/usr/lib/x86_64-linux-gnu/glib-2.0/include",
        ])
        .derive_debug(false)
        .derive_copy(false)
        .layout_tests(false)
        .generate()
        .expect("Unable to generate bindings");

    let out_path = PathBuf::from(env::var("OUT_DIR").unwrap());
    bindings
        .write_to_file(out_path.join("bindings.rs"))
        .expect("Couldn't write bindings!");
}
