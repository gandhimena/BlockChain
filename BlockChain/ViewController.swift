//
//  ViewController.swift
//  BlockChain
//
//  Created by spychatter mx on 1/19/18.
//  Copyright © 2018 trenx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let transaction = Transaction(from: "Mary", to: "Steve", amount: 20)
		
		let block = Block()
		block.addTransaction(transaction: transaction)
		let result = block.key
		print(result)
		
		let blockchain = Blockchain(genesisBlock: block)
		let secondTransaction = Transaction(from: "Mary", to: "Jhon", amount: 10)
		let secondBlock = blockchain.getNextBlock(transactions: [secondTransaction])
		
		blockchain.addBlock(secondBlock)
		
		
		
		
	}



}

