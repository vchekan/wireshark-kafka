extern crate bindgen;

use std::env;
use std::path::PathBuf;

fn main() {
    println!("cargo:rustc-link-lib=wireshark");
    #[cfg(target_os = "macos")]
    print!("cargo:rustc-link-search=./wireshark-ninja/run");

    let bindings = bindgen::Builder::default()
        .header("src/wrapper.h")
        .derive_debug(false)
        .derive_copy(false)
        .layout_tests(false)
        .clang_args(vec![
            "-D",
            "HAVE_PLUGINS"]);

    #[cfg(target_os = "linux")]
    let bindings = bindings.clang_args(vec![
            "-I/usr/include/wireshark",
            "-I/usr/include/glib-2.0",
            "-I/usr/lib/x86_64-linux-gnu/glib-2.0/include",
        ]);

    #[cfg(target_os = "macos")]
    let bindings = bindings.clang_args(vec![
        "-I../wireshark-src",
        "-I/usr/local/include/glib-2.0",
        "-I/usr/local/Cellar/glib/2.64.3/lib/glib-2.0/include"
    ]);

    let out_dir = PathBuf::from(env::var("OUT_DIR").unwrap());
    bindings.generate().expect("Unable to generate bindings")
        .write_to_file(out_dir.join("bindings.rs"))
        .expect("Couldn't write bindings!");
}
