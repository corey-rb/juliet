//
//  GenericDestination.swift
//  Juliet
//
//  Created by Rudy Bermudez on 10/24/17.
//  Copyright © 2017 Rogue Bit Studios. All rights reserved.
//

import Foundation

open class BaseOutput: Hashable {
	
	public var showDateTime = true
	public var dateFormat = "HH:mm:ss.SSS"
	
	public var timeZone: TimeZone? = TimeZone(abbreviation: "UTC")

	public var showLogLevel = true
	
	public var showFileName = true
	
	public var showLineNumber = true
	
	public var showFunctionName = true
	
	public var showLogLevelEmoji = true
	
	public var minLevel = LogLevel.verbose
	
	/// runs in own serial background thread for better performance
	open var asynchronously = true
	
	var queue: DispatchQueue?
	
	public init() {
		let uuid = NSUUID().uuidString
		let queueLabel = "Juliet-queue-" + uuid
		queue = DispatchQueue(label: queueLabel, target: queue)
	}
	
	let formatter = DateFormatter()
	
	
	open func acceptLog(_ level: LogLevel, function: String, file: String, line: Int, message: String) -> String? {
		return formatMessage(level, function: function, file: file, line: line, message: message)
	}
	
	// MARK: - Formatting
	private func formatMessage(_ level: LogLevel, function: String, file: String, line: Int, message: String) -> String {
		var dateComponent = ""
		var fileName = ""
		var functionName = ""
		var lineNumber = ""
		var levelDescription = ""
		var emoji = ""
		
		if showDateTime {
			dateComponent = "[\(formatDate(dateFormat))]"
		}
		if showFileName {
			fileName = fileNameOfFileWithoutFileType(file)
			if showFunctionName {
				fileName += "."
			} else {
				fileName += " "
			}
		}
		if showFunctionName {
			functionName = function
		}
		if showLineNumber {
			lineNumber = ":\(line)"
		}
		if showLogLevelEmoji {
			emoji = level.emoji
		}
		if showLogLevel {
			levelDescription = level.description
		}
		return "\(dateComponent) \(fileName)\(functionName)\(lineNumber) \(emoji) \(levelDescription): \(message)"
	}
	
	func formatDate(_ dateFormat: String) -> String {
		formatter.timeZone = timeZone
		formatter.dateFormat = dateFormat
		let dateStr = formatter.string(from: Date())
		return dateStr
	}
	
	
	/// returns the filename of a path
	private func fileNameOfFile(_ file: String) -> String {
		let fileParts = file.components(separatedBy: "/")
		if let lastPart = fileParts.last {
			return lastPart
		}
		return ""
	}
	
	/// returns the filename of a path
	private func fileNameOfFileWithoutFileType(_ file: String) -> String {
		let fileParts = fileNameOfFile(file).components(separatedBy: ".")
		if let firstPart = fileParts.first {
			return firstPart
		}
		return ""
	}
	
	// MARK: - Helpers
	func shouldLevelBeLogged(_ level: LogLevel) -> Bool {
		if level.rawValue >= minLevel.rawValue {
			return true
		} else {
			return false
		}
	}
	
	// MARK : - Hashable and Equitable
	lazy public var hashValue: Int = self.defaultHashValue
	open var defaultHashValue: Int {return 0}
	
	public static func ==(lhs: BaseOutput, rhs: BaseOutput) -> Bool {
		return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
	}
	
	
}
