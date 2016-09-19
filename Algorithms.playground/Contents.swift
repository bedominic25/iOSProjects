//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//NSLog("%@",str)

let array = [5,2,4,7]
linearSearch(array,2)


func linearSearch<T: Equatable>(array: [T], _ object:T)-> Int? {
    for (index, obj) in array.enumerate() where obj == object {
        return index
    }
    return nil
}


public struct Stack<T> {
    fileprivate var  array = [T]()
    
    public var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public func peek() -> T? {
        return array.last
    }
}

extension Stack: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var curr = self
        return AnyIterator {
            -> T? in
            return curr.pop()
        }
    }
}