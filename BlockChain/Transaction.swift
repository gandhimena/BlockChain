//
//  Transaction.swift
//  BlockChain
//
//  Created by spychatter mx on 1/19/18.
//  Copyright © 2018 trenx. All rights reserved.
//

import Foundation

class Transaction: Codable{
	var from: String?
	var to: String?
	var amount: Double?
	
	init(from: String, to: String, amount: Double) {
		self.from = from
		self.to = to
		self.amount = amount
	}
	
}
