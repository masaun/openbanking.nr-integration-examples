use zkpassport_common;
use zkpassport_age::{
    compare_age
};


/**
 * @notice - Verify the age of a user using the ZK Passport Age Verifier.
 */
pub fn verify_age(
    dg1: [u8; 95], 
    min_age: u8, 
    max_age: u8, 
    current_date_bytes: [u8; 8]
) {
    compare_age(dg1, min_age, max_age, current_date_bytes);
}