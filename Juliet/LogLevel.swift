//
//  LogLevel.swift
//  Juliet
//
//  Created by Rudy Bermudez on 10/24/17.
//  Copyright © 2017 Rogue Bit Studios. All rights reserved.
//

import Foundation

/// Log Level used in Juliet Logger
public enum LogLevel: Int, CustomStringConvertible {
	// Int defines Log Level Precedence
	case all = 0
	case verbose = 1
	case debug = 2
	case info = 3
	case warning = 4
	case error = 5
	case none = 6
	
	/// Description of Log Level
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
	
	/// Emoji Log Level Indicator
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
	/// `LogLevel.all` if in Debug
	/// `LogLevel.warning` if in Production
	#if DEBUG
	static public let defaultLevel = LogLevel.all
	#else
	static public let defaultLevel = LogLevel.warning
	#endif
}
