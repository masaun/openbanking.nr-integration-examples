use dep::std::verify_proof;

pub struct SemaphoreProof {
    verification_key: [Field; 128],
    proof: [Field; 456],
    public_inputs: [Field; 4],
    key_hash: Field,
}

// Batch 2 Semaphore proofs into a single proof
pub fn verify_recursive_proof(proofs: [SemaphoreProof; 2]) -> Field {
    // Note that actual verification happens when this proof gets verified
    verify_proof(
        proofs[0].verification_key,
        proofs[0].proof,
        proofs[0].public_inputs,
        proofs[0].key_hash,
    );

    verify_proof(
        proofs[1].verification_key,
        proofs[1].proof,
        proofs[1].public_inputs,
        proofs[1].key_hash,
    );

    // hash nullifiers, roots, scope, message together
    let mut public_input_bytes = [0 as u8; 256];
    for i in 0..32 {
        //proof_1_scope
        public_input_bytes[i] = proofs[0].public_inputs[0].to_be_bytes::<32>()[i];
        //proof_2_scope
        public_input_bytes[i + 32] = proofs[1].public_inputs[0].to_be_bytes::<32>()[i];
        //proof_1_message
        public_input_bytes[i + 64] = proofs[0].public_inputs[1].to_be_bytes::<32>()[i];
        //proof_2_message
        public_input_bytes[i + 96] = proofs[1].public_inputs[1].to_be_bytes::<32>()[i];
        //proof_1_root
        public_input_bytes[i + 128] = proofs[0].public_inputs[2].to_be_bytes::<32>()[i];
        //proof_2_root
        public_input_bytes[i + 160] = proofs[1].public_inputs[2].to_be_bytes::<32>()[i];
        //proof_1_nullifier
        public_input_bytes[i + 192] = proofs[0].public_inputs[3].to_be_bytes::<32>()[i];
        //proof_2_nullifier
        public_input_bytes[i + 224] = proofs[1].public_inputs[3].to_be_bytes::<32>()[i];
    }

    Field::from_be_bytes(keccak256::keccak256(public_input_bytes, 256))
}