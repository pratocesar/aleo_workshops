// The 'private_auction_24999' program.
program private_auction_24999.aleo {

    // Define a global constant for the owner's address
    const OWNER_ADDRESS: address = aleo14gcv36gp2uaq2eas25n89qf322cv2nqnsuk742wmcvj89vcdgvrs7ew50w;

    // Define the Bid record
    record Bid {
        owner: address,         // The owner of the auction
        bidder: address,        // The address of the bidder
        amount: u64,            // The bid amount 
        is_winner: bool,        // Flag to indicate if this bid is the winning bid 
    }

    // Transition to place a bid
    transition place_bid(bidder: address, amount: u64) -> Bid {
        // Ensure the caller is the bidder
        assert_eq(self.caller, bidder);
        
        // Return a new Bid record
        return Bid {
            owner: OWNER_ADDRESS,
            bidder: bidder,
            amount: amount,
            is_winner: false,
        };
    }

    // Transition to resolve the auction by comparing two bids
    transition resolve(first: Bid, second: Bid) -> Bid {
        // Ensure the caller is the auction owner
        assert_eq(self.caller, OWNER_ADDRESS);
       
        // Determine the winning bid
        if (first.amount >= second.amount) {
            return first;
        } else {
            return second;
        }
    }

    // Transition to finish the auction and mark a bid as the winner
    transition finish(bid: Bid) -> Bid {
        // Ensure the caller is the auction owner
        assert_eq(self.caller, OWNER_ADDRESS);
        
        // Mark the bid as the winning bid
        return Bid {
            owner: bid.owner,
            bidder: bid.bidder,
            amount: bid.amount,
            is_winner: true,
        };
    }
}
