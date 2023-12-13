module GoldCoin::GoldCoin {
    use std::signer;
    use BasicCoin::BasicCoin;
    use sui::object::{UID,Self};
    use sui::tx_context::{TxContext,Self};
    use sui::transfer;
    
    struct GoldCoin has drop {}

    public fun setup_and_mint(account: &signer, amount: u64) {
        BasicCoin::publish_balance<GoldCoin>(account);
        BasicCoin::mint<GoldCoin>(signer::address_of(account), amount, GoldCoin{});
    }

    public fun transfer(from: &signer, to: address, amount: u64) {
        BasicCoin::transfer<GoldCoin>(from, to, amount, GoldCoin {});
    }
}