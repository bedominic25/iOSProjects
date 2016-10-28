//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//NSLog("%@",str)

var myArray :NSMutableArray = ["Hello"]
var arrayOFArray : NSMutableArray = [myArray]

// Insert more Arrays with insert or addObject
arrayOFArray.insert("Plane", at: 0)
arrayOFArray.add(myArray)


//NSArray * numbers = @[@0, @2, @3, @4, @5]
//NSArray * sortedNumbers = [numbers sortedArrayUsingComparator:^NSComparisonResult(id first, id Second)
//if(first > second){
//    return NSOrderedDescending
//}else {
//    return NSOrderedAscending
//}
//return NSOorderedSame

func sortFunc(num1: Int, num2: Int) -> Bool{
    return num1 > num2
}

let numbers = [0, 10, 30, 7, 6,9]
let sortedNumbers = sorted(numbers,sortFunc(num1: Int, num2: Int),