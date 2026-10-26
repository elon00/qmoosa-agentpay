# -*- coding: utf-8 -*-
import json
import time
import hashlib

class TUMAgentNegotiator:
    def __init__(self, buyer_id: str, seller_id: str, max_allowance: float):
        self.buyer_id = buyer_id
        self.seller_id = seller_id
        self.max_allowance = max_allowance

    def negotiate_and_settle(self, service_spec: str, proposed_price: float) -> dict:
        if proposed_price > self.max_allowance:
            return {"status": "FAILED", "reason": "Price exceeds policy allowance"}
        
        contract_hash = hashlib.sha256(f"{self.buyer_id}:{self.seller_id}:{service_spec}:{proposed_price}".encode()).hexdigest()
        return {
            "status": "SETTLED",
            "contract_hash": f"0x{contract_hash}",
            "buyer": self.buyer_id,
            "seller": self.seller_id,
            "service": service_spec,
            "settled_amount": proposed_price,
            "oracle_source": "API3 dAPI",
            "timestamp": int(time.time())
        }

if __name__ == "__main__":
    negotiator = TUMAgentNegotiator("tum_buyer_bot", "tum_seller_bot", 50.0)
    res = negotiator.negotiate_and_settle("AI Document Classification API", 15.0)
    print("Agent Negotiation Contract:", json.dumps(res, indent=2))
