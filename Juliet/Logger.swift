//MIT License
//
//Copyright (c) 2017 Rudy Bermudez
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
	
	private static var destinations = Set<BaseOutput>()
	
    open var enabled : Bool = true
	
	@discardableResult
	public class func add(destination: BaseOutput) -> Bool {
		if destinations.contains(destination) {
			return false
		} else {
			destinations.insert(destination)
			return true
		}
	}
	
	@discardableResult
	public class func remove(destination: BaseOutput) -> Bool {
		if destinations.contains(destination) {
			destinations.remove(destination)
			return true
		} else {
			return false
		}
	}
	
	open class func removeAllDestinations() {
		destinations.removeAll()
	}
	
	open class func countDestinations() -> Int {
		return destinations.count
	}
	
	public class func verbose(_ message: @autoclosure () -> Any, function: String = #function, file: String = #file, line: Int = #line) {
		log(.verbose, function: function, file: file, line: line, message: message)
	}
	
	public class func debug(_ message: @autoclosure () -> Any, function: String = #function, file: String = #file, line: Int = #line) {
		log(.debug, function: function, file: file, line: line, message: message)
	}
	
	public class func info(_ message: @autoclosure () -> Any, function: String = #function, file: String = #file, line: Int = #line) {
		log(.info, function: function, file: file, line: line, message: message)
	}
	
	public class func warning(_ message: @autoclosure () -> Any, function: String = #function, file: String = #file, line: Int = #line) {
		log(.warning, function: function, file: file, line: line, message: message)
	}
	
	public class func error(_ message: @autoclosure () -> Any, function: String = #function, file: String = #file, line: Int = #line) {
		log(.error, function: function, file: file, line: line, message: message)
	}
	
	fileprivate class func log(_ level: LogLevel, function: String = #function, file: String = #file, line: Int = #line, message: @autoclosure () -> Any) {
		
		for dest in destinations {
			
			guard let queue = dest.queue else {
				continue
			}
			
			if dest.shouldLevelBeLogged(level) {
				let message = "\(message())"
				if dest.asynchronously {
					queue.async {
						_ = dest.acceptLog(level, function: function, file: file, line: line, message: message)
					}
				} else {
					queue.sync {
						_ = dest.acceptLog(level, function: function, file: file, line: line, message: message)
					}
				}
				
			}
		}
	}
	
    
}
