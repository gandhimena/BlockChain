//
//  Block.swift
//  BlockChain
//
//  Created by spychatter mx on 1/19/18.
//  Copyright © 2018 trenx. All rights reserved.
//

import Foundation

class Block {
	
	var index = 0
	var previousHash = ""
	var hash:String!
	var nonce: Int
	private (set) var transactions = [Transaction]()
	
	var key: String{
		let transactionData = try! JSONEncoder().encode(self.transactions)
		let transactionJSONString = String(data: transactionData, encoding: .utf8)
		return String(self.index) + self.previousHash + String(self.nonce) + transactionJSONString!
	}
	init() {
		self.nonce = 0
	}
	
	func addTransaction(transaction: Transaction){
		self.transactions.append(transaction)
	}
	
}
