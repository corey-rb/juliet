//
//  LogLevel.swift
//  Juliet
//
//  Created by Rudy Bermudez on 10/24/17.
//  Copyright © 2017 Rogue Bit Studios. All rights reserved.
//

import Foundation

public enum LogLevel: Int, CustomStringConvertible {
	
	case all = 0
	case verbose = 1
	case debug = 2
	case info = 3
	case warning = 4
	case error = 5
	case none = 6
	
	public var description: String {
		switch self {
		case .verbose:
			return "Verbose"
		case .debug:
			return "Debug"
		case .info:
			return "Info"
		case .warning:
			return "Warning"
		case .error:
			return "Error"
		default:
			assertionFailure("Invalid Log Level")
			return "NULL"
		}
	}
	
	public var emoji : String {
		switch self {
		case .verbose:
			return "🗣"
		case .debug:
			return "🔧"
		case .info:
			return "📝"
		case .warning:
			return "⚠️"
		case .error:
			return "🚨"
		default:
			assertionFailure("Invalid Log Level")
			return "NULL"
		}
	}
	
	/// Default log level
	/// Be sure to set the "DEBUG" symbol.
	/// Set it in the "Swift Compiler - Custom Flags" section, "Other Swift Flags" line. Add "-D DEBUG" entry.
	#if DEBUG
	static public let defaultLevel = LogLevel.all
	#else
	static public let defaultLevel = LogLevel.warning
	#endif
}
