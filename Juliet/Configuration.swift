//MIT License
//
//Copyright (c) 2017 Corey Schaf @ Rogue Bit Studios (roguebit.io)
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

import Foundation

public protocol Configurable {
    
    var levels : [LogLevel] { get set }
    
    var composerType : ComposerType { get set }
    
    //@objc optional func postInitalize()
    
}

public struct Configuration : Configurable {
	
	public static let defaultConfiguation: Configuration = Configuration()
	
    public var levels : [LogLevel]
    
    public var exportFormat : ExportFormat
    
    public var composerType : ComposerType
    
    
    private init() {
        self.levels =  [LogLevel.noerror, LogLevel.warning, LogLevel.alert, LogLevel.error, LogLevel.fatal]
        self.exportFormat = .json
        self.composerType = .console
    }
    
    public init(logLevels : [LogLevel], composer : ComposerType) {
        self.exportFormat = .json
        self.composerType = composer
        self.levels = logLevels
    }
}

public enum ComposerType {
    case console
    case http
}

public protocol LoggableLevel {
}

public enum LogLevel : LoggableLevel {
    case noerror
    case warning
    case alert
    case error
    case fatal
}

extension LogLevel : CustomStringConvertible {
    public var description : String {
        switch self {
        case .noerror:
            return "NoError"
        case .warning:
            return "Warning"
        case .alert:
            return "Alert"
        case .error:
            return "Error"
        case .fatal:
            return "Fatal"
        default:
            return "NA"
        }
    }
}

public enum ExportFormat {
    case json
    case xml
}

