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

open class Logger {
	
	static let shared: Logger = Logger(configuration: Configuration.defaultConfiguation)
	
    open var enabled : Bool = true
    
    open var configuration : Configurable
    
    var router : Router
    
    private var composer : OutputComposer
    
    public init(configuration : Configurable) {
        self.configuration = configuration
        self.router = Router()
        switch configuration.composerType {
        case .console:
            self.composer = ConsoleComposer()
        case .http:
            self.composer = HttpComposer()
        default:
            self.composer = ConsoleComposer()
        }
    }
    
    // this would print out each level
    // to its corresponding router
    public func log(level : LogLevel, message : String) {
        
        guard self.enabled else {
            return
        }
        
        switch level {
        case .noerror:
            guard self.configuration.levels.contains(.noerror) else {
                return
            }
            self.composer.log(logMessage: message)
        case .alert:
            guard self.configuration.levels.contains(.alert) else {
                return
            }
            self.composer.log(logMessage: message)
        case .warning:
            guard self.configuration.levels.contains(.warning) else {
                return
            }
            self.composer.logWarning(logMessage: message)
        case .error:
            guard self.configuration.levels.contains(.error) else {
                return
            }
            self.composer.log(logMessage: message)
        case .fatal:
            guard self.configuration.levels.contains(.fatal) else {
                return
            }
            self.composer.log(logMessage: message)
        default:
            self.composer.log(logMessage: "No level supplied: \(message)")
        }
    }
    
}
