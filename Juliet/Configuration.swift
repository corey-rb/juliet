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

protocol Configurable {
    
    var levels : [LogLevel] { get set }
    
    var composer : OutputComposer { get set }
    
    //@objc optional func postInitalize()
    
}

struct Configuration : Configurable {
    
    var levels : [LogLevel]
    
    var exportFormat : ExportFormat
    
    var composer : OutputComposer
    
    private init() {
        levels =  [LogLevel.noerror, LogLevel.warning, LogLevel.alert, LogLevel.error, LogLevel.fatal]
        exportFormat = .json
        composer = ConsoleComposer()
    }
    
    init(format : ExportFormat, composer : OutputComposer) {
        self.init()
        self.exportFormat = format
        self.composer = composer
    }
}

protocol LoggableLevel {
}

enum LogLevel : LoggableLevel {
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

enum ExportFormat {
    case json
    case xml
}

