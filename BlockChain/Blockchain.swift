//
//  Blockchain.swift
//  BlockChain
//
//  Created by spychatter mx on 1/19/18.
//  Copyright © 2018 trenx. All rights reserved.
//

import Foundation

class Blockchain{
	
	private (set) var blocks = [Block]()
	
	init(genesisBlock:Block) {
		addBlock(genesisBlock)
	}
	
	func addBlock(_ block: Block){
		if self.blocks.isEmpty{
			block.previousHash = "0000000000000000"
			block.hash = generateHash(for: block)
		}
		
		self.blocks.append(block)
	}
	
	func getNextBlock(transactions:[Transaction]) -> Block{
		
		let block = Block()
		transactions.forEach{ block.addTransaction(transaction: $0) }
		let previousBlock = getPreviousBlock()
		block.index = self.blocks.count
		block.previousHash = previousBlock.hash
		block.hash = generateHash(for: block)
		return block
	}
	
	func getPreviousBlock() -> Block{
		return self.blocks[self.blocks.count - 1]
	}
	func generateHash(for block: Block) -> String{
		let hash = block.key.sha1Hash()
		return hash
	}
}
