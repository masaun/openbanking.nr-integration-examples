mod openbanking;
mod zkpassport;
mod tests;

use openbanking::openbanking_integrator::{
    OpenbankingVerifierParams,
    verify_bank_payment
};

use zkpassport::zkpassport_integrator::{
    verify_age
};


fn main(
    dg1: [u8; 95], 
    min_age: u8, 
    max_age: u8, 
    current_date_bytes: [u8; 8],
    params: OpenbankingVerifierParams
    //x: Field, y: pub Field, z: pub Field
) {
    

    
    //assert((x != y) & (y != z));
}
