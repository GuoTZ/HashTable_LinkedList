//
//  main.swift
//  HashTable_LinkedList
//
//  Created by DingYD on 2019/5/15.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Foundation



class Dog: Hashable,CustomDebugStringConvertible {
    var name = ""
    var age = 0
    init(name:String,age:Int) {
        self.name = name
        self.age = age
    }
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        return (lhs.age - rhs.age) >= 0
    }
    
    
    var hashValue: Int {
        return self.name.hashValue ^ self.age.hashValue
    }
    func hash(into hasher: inout Hasher) {
        print(hasher)
    }
    var debugDescription: String {
        return "狗名是"+self.name+"年龄是\(self.age)"
    }
}

var ht = HashTable<Dog,Int>()

for i in 0...100 {
    let dog = Dog(name: "张\(i)", age: i)
    ht.add(key: dog, value: i)
}
print(ht)



for i in 0...1000000 {
    let dog = Dog(name: "TString\(i)", age: i)
    ht.add(key: dog, value: i)
}

print("当前哈希表的大小\(ht.getSize())")
/*
 [{"HashTable_LinkedList.Dog":"51",},
 {"HashTable_LinkedList.Dog":"97","HashTable_LinkedList.Dog":"57","HashTable_LinkedList.Dog":"48",},
 {"HashTable_LinkedList.Dog":"56","HashTable_LinkedList.Dog":"47",},
 {},
 {"HashTable_LinkedList.Dog":"90","HashTable_LinkedList.Dog":"50",},
 {"HashTable_LinkedList.Dog":"89","HashTable_LinkedList.Dog":"32",},
 {},
 {},
 {"HashTable_LinkedList.Dog":"69",},
 {"HashTable_LinkedList.Dog":"41",},
 {"HashTable_LinkedList.Dog":"52",},
 {"HashTable_LinkedList.Dog":"100",},
 {"HashTable_LinkedList.Dog":"72","HashTable_LinkedList.Dog":"44",},
 {"HashTable_LinkedList.Dog":"70","HashTable_LinkedList.Dog":"34",},
 {},
 {},
 {"HashTable_LinkedList.Dog":"19",},
 {},
 {"HashTable_LinkedList.Dog":"5",},
 {},
 {"HashTable_LinkedList.Dog":"20",},
 {},
 {"HashTable_LinkedList.Dog":"54",},
 {},
 {"HashTable_LinkedList.Dog":"91",},
 {},
 {},
 {"HashTable_LinkedList.Dog":"65",},
 {"HashTable_LinkedList.Dog":"62",},
 {"HashTable_LinkedList.Dog":"64","HashTable_LinkedList.Dog":"42",},
 {"HashTable_LinkedList.Dog":"85",},
 {},
 {"HashTable_LinkedList.Dog":"83","HashTable_LinkedList.Dog":"40","HashTable_LinkedList.Dog":"14","HashTable_LinkedList.Dog":"3",},
 {},
 {"HashTable_LinkedList.Dog":"31","HashTable_LinkedList.Dog":"0",},
 {},
 {},
 {},
 {"HashTable_LinkedList.Dog":"36","HashTable_LinkedList.Dog":"18",},
 {},
 {"HashTable_LinkedList.Dog":"99",},
 {"HashTable_LinkedList.Dog":"78","HashTable_LinkedList.Dog":"45",},
 {"HashTable_LinkedList.Dog":"1",},
 {},
 {"HashTable_LinkedList.Dog":"13",},
 {"HashTable_LinkedList.Dog":"98",},
 {"HashTable_LinkedList.Dog":"81","HashTable_LinkedList.Dog":"55",},
 {"HashTable_LinkedList.Dog":"88","HashTable_LinkedList.Dog":"74","HashTable_LinkedList.Dog":"46","HashTable_LinkedList.Dog":"33",},
 {"HashTable_LinkedList.Dog":"37","HashTable_LinkedList.Dog":"28",},
 {},
 {"HashTable_LinkedList.Dog":"53","HashTable_LinkedList.Dog":"49","HashTable_LinkedList.Dog":"43","HashTable_LinkedList.Dog":"26",},
 {},
 {"HashTable_LinkedList.Dog":"71",},
 {},
 {"HashTable_LinkedList.Dog":"17",},
 {"HashTable_LinkedList.Dog":"82","HashTable_LinkedList.Dog":"79",},
 {"HashTable_LinkedList.Dog":"6",},
 {"HashTable_LinkedList.Dog":"39",},
 {"HashTable_LinkedList.Dog":"95","HashTable_LinkedList.Dog":"25",},
 {"HashTable_LinkedList.Dog":"84","HashTable_LinkedList.Dog":"7","HashTable_LinkedList.Dog":"2",},
 {"HashTable_LinkedList.Dog":"24",},
 {"HashTable_LinkedList.Dog":"76",},
 {"HashTable_LinkedList.Dog":"94","HashTable_LinkedList.Dog":"92",},
 {"HashTable_LinkedList.Dog":"35",},
 {},
 {"HashTable_LinkedList.Dog":"59",},
 {},
 {},
 {"HashTable_LinkedList.Dog":"75","HashTable_LinkedList.Dog":"73","HashTable_LinkedList.Dog":"9",},
 {"HashTable_LinkedList.Dog":"63","HashTable_LinkedList.Dog":"21","HashTable_LinkedList.Dog":"11",},
 {},
 {},
 {"HashTable_LinkedList.Dog":"29",},
 {"HashTable_LinkedList.Dog":"87","HashTable_LinkedList.Dog":"27",},
 {"HashTable_LinkedList.Dog":"66",},
 {},
 {},
 {"HashTable_LinkedList.Dog":"4",},
 {"HashTable_LinkedList.Dog":"38","HashTable_LinkedList.Dog":"15",},
 {"HashTable_LinkedList.Dog":"80",},
 {},
 {"HashTable_LinkedList.Dog":"67",},
 {"HashTable_LinkedList.Dog":"96",},
 {"HashTable_LinkedList.Dog":"10",},
 {},
 {},
 {"HashTable_LinkedList.Dog":"77",},
 {},
 {},
 {},
 {"HashTable_LinkedList.Dog":"16",},
 {"HashTable_LinkedList.Dog":"86","HashTable_LinkedList.Dog":"60","HashTable_LinkedList.Dog":"58",},
 {"HashTable_LinkedList.Dog":"30",},
 {"HashTable_LinkedList.Dog":"68","HashTable_LinkedList.Dog":"8",},
 {"HashTable_LinkedList.Dog":"93","HashTable_LinkedList.Dog":"23","HashTable_LinkedList.Dog":"12",},
 {"HashTable_LinkedList.Dog":"61","HashTable_LinkedList.Dog":"22",},
 {},
 ]
 */
