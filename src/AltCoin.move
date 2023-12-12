module AltCoin::AltCoin {
    use std::signer;
    use BasicCoin::BasicCoin;
updateupdate
    struct AltCoin has drop {}

    public fun setup_and_mint(account: &signer, amount: u64) {
        BasicCoin::publish_balance<AltCoin>(account);
        BasicCoin::mint<AltCoin>(signer::address_of(account), amount, AltCoin {});
    }

    public fun transfer(from: &signer, to: address, amount: u64) {
        BasicCoin::transfer<AltCoin>(from, to, amount, AltCoin {});
    }
}