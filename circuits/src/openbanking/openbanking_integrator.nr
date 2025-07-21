use openbanking_verifier::{ 
    io::{OpenbankingVerifierParams, OpenbankingVerifierReturn},
    verify::verify_openbanking_payment,
};


/**
 * @notice - Verify a bank payment using the Openbanking Verifier.
 */
pub fn verify_bank_payment(
    params: OpenbankingVerifierParams
) -> OpenbankingVerifierReturn {
    let openbanking_verifier_return = verify_openbanking_payment(params);
    openbanking_verifier_return
} 