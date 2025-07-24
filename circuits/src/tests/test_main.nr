use crate::{
    main, 
    openbanking,
    zkpassport,
};

use openbanking::openbanking_integrator::{
    OpenbankingVerifierParams,
};


#[test]
fn test_main() {
    main(1, 2, 1);
}