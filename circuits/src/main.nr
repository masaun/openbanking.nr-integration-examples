mod openbanking;
mod zkpassport;
mod recursive_proof;
mod tests;

use openbanking::openbanking_integrator::{
    OpenbankingVerifierParams,
    verify_bank_payment
};

use zkpassport::zkpassport_integrator::{
    verify_age
};

use recursive_proof::recursive_proof_generator::{
    verify_recursive_proof,
    SemaphoreProof
};


fn main(
    dg1: [u8; 95], 
    min_age: u8, 
    max_age: u8, 
    current_date_bytes: [u8; 8],
    params: OpenbankingVerifierParams,
    proofs: [SemaphoreProof; 2]
    //x: Field, y: pub Field, z: pub Field
) {
    // @dev - Verify the age of a user using the ZK Passport Age Verifier.
    verify_age(dg1, min_age, max_age, current_date_bytes);

    // @dev - Verify a bank payment using the Open Banking Verifier.
    let openbanking_verifier_return = verify_bank_payment(params);

    // @dev - Verify a recursive proof using the Semaphore Proof Verifier.
    // let sp: [SemaphoreProof; 2] = [
    //     SemaphoreProof {
    //         verification_key: [Field::zero(); 128],
    //         proof: [Field::zero(); 456],
    //         public_inputs: [Field::zero(); 4],
    //         key_hash: Field::zero(),
    //     },
    //     SemaphoreProof {
    //         verification_key: [Field::zero(); 128],
    //         proof: [Field::zero(); 456],
    //         public_inputs: [Field::zero(); 4],
    //         key_hash: Field::zero(),
    //     }
    // ];
    let return_value: Field = verify_recursive_proof(proofs);

    //assert((x != y) & (y != z));
}
