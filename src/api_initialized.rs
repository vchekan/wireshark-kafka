use std::ops::Deref;

/// Bypass Rust's safety and allow static mutable data.
/// Is used when program written in C needs to initialize data of plugin written in Rust.
/// Implements unsafe `Sync` because data wrapped in `ApiInitialized` is exposed to no additional
/// danger because it is host C application responsibility to provide safety.
pub struct ApiInitialized<T>(T);
unsafe impl <T> Sync for ApiInitialized<T> {}

impl <T> ApiInitialized<T> {
    pub const fn new(v: T) -> Self { ApiInitialized(v) }

    /// `self` is immutable because: "mutable references are not allowed in statics"
    pub const fn ptr_for_api_init(&self) -> *mut T {
        &self.0 as * const T as *mut T
    }
}

impl <T> Deref for ApiInitialized<T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

