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

public protocol OutputComposer {
    func log(logMessage : String)
    func logWarning(logMessage : String)
    func logNoError(logMessage : String)
    func logAlert(logMessage : String)
    func logError(logMessage : String)
    func logFatal(logMessage : String)
}

open class ConsoleComposer : OutputComposer {
    
    private let linePrefix : String = "Juliet: "
    
    public func log(logMessage : String) {
        print("\(linePrefix) \(logMessage)")
    }
    
    public func logWarning(logMessage : String) {
        let log = "WARNING - \(logMessage)"
        self.log(logMessage: log)
    }
    
    public func logNoError(logMessage: String) {
        let log = "NOERROR - \(logMessage)"
        self.log(logMessage: log)
    }
    
    public func logAlert(logMessage: String) {
        let log = "ALERT - \(logMessage)"
        self.log(logMessage: log)
    }
    
    public func logError(logMessage: String) {
        let log = "ERROR - \(logMessage)"
        self.log(logMessage: log)
    }
    
    public func logFatal(logMessage: String) {
        let log = "FATAL - \(logMessage)"
        self.log(logMessage: log)
    }
}

open class HttpComposer : OutputComposer {
    
    public func log(logMessage : String) {
    }
    
    public func logWarning(logMessage: String) {
    }
    
    public func logNoError(logMessage : String) {
        
    }
    
    public func logAlert(logMessage : String) {
        
    }
    
    public func logError(logMessage : String) {
        
    }
    
    public func logFatal(logMessage : String) {
        
    }
    
}
