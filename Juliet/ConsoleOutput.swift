//
//  ConsoleOutput.swift
//  Juliet
//
//  Created by Rudy Bermudez on 10/25/17.
//  Copyright © 2017 Rogue Bit Studios. All rights reserved.
//

import Foundation

public class ConsoleOutput: BaseOutput {
	
	public var useNSLog = false
	
	override public var defaultHashValue: Int { return 1 }
	
	public override init() {
		super.init()
	}
	
	override public func acceptLog(_ level: LogLevel, function: String, file: String, line: Int, message: String) -> String? {
		let formattedString = super.acceptLog(level, function: function, file: file, line: line, message: message)
		if let str = formattedString {
			if useNSLog {
				#if os(Linux)
					print(str)
				#else
					NSLog("%@", str)
				#endif
			} else {
				print(str)
			}
		}
		return formattedString
	}
}
