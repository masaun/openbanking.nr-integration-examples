mod openbanking;
mod tests;

fn main(x: Field, y: pub Field, z: pub Field) {
    assert((x != y) & (y != z));
}
