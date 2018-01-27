//
//  String+BlockChain.swift
//  BlockChain
//
//  Created by spychatter mx on 1/25/18.
//  Copyright © 2018 trenx. All rights reserved.
//

import Foundation

extension String {
	
	func sha1Hash() -> String {
		
		let task = Process()
		task.launchPath = "/usr/bin/shasum"
		task.arguments = []
		
		let inputPipe = Pipe()
		
		inputPipe.fileHandleForWriting.write(self.data(using: String.Encoding.utf8)!)
		
		inputPipe.fileHandleForWriting.closeFile()
		
		let outputPipe = Pipe()
		task.standardOutput = outputPipe
		task.standardInput = inputPipe
		task.launch()
		
		let data = outputPipe.fileHandleForReading.readDataToEndOfFile()
		let hash = String(data: data, encoding: String.Encoding.utf8)!
		return hash.replacingOccurrences(of: "  -\n", with: "")
	}
}
