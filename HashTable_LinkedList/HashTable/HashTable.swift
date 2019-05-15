//
//  HashTable.swift
//  HashTable_LinkedList
//
//  Created by DingYD on 2019/5/15.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Cocoa

/// 哈希表 k必须x实现 Hashable协议
/// 实现Hashable的哈希值hashValue
/// Equatable 实现 == isEqual
class HashTable<K,V>:CustomDebugStringConvertible where K :Hashable {
    private let capacitys = [53,97,193,389,769,1543,3079,6151,12289,24593,49157,98317,196613,393241,786433,1572869,3145739,
                             6291469,12582917,25165843,50331653,100663319,201326611,402653189,805306457,1610612741,]
    /// 平均每个索引哈希冲突的上限值
    private let upperTol = 10
    
    /// 平均每个索引哈希冲突的下限值
    private let lowerTol = 2
    private let initCapacity = 7
    
    private var lienkedTables: Array<LinkedList<K,V>>
    private var size:Int
    private var M:Int
    private var capacityIndex:Int = 0
    init() {
        self.M = capacitys[self.capacityIndex]
        self.size = 0
        self.lienkedTables = Array<LinkedList<K,V>>()
        for _ in 0..<M {
            self.lienkedTables.append(LinkedList<K,V>())
        }
    }
    func getSize() -> Int {
        return self.size
    }
    /// 哈希函数
    ///
    /// - Parameter key: key description
    /// - Returns: return value description
    func hash(key:K) -> Int {
        // 对key的哈希值转成正数 再取模
        return (key.hashValue & 0x7fffffff) % M
    }
    func add(key:K,value:V) {
        
        /// 再哈希表里面获取对key哈希处理后的链表
        let linked = self.lienkedTables[hash(key: key)]
        if linked.contains(key: key) {
            //如果链表中存在key对应的节点
            linked.set(key: key, value: value)
        } else {
            linked.add(key: key, value: value)
            size += 1;
            
            /// 用静态数组实现时进行扩容
            if self.size >= self.upperTol*M && capacityIndex + 1 < capacitys.count {
                capacityIndex += 1
                self.resize(newM: self.capacitys[self.capacityIndex])
            }
        }
    }
    func set(key:K,value:V) {
        /// 再哈希表里面获取对key哈希处理后的链表
        let linked = self.lienkedTables[hash(key: key)]
        if linked.contains(key: key) {
            linked.set(key: key, value: value)
        }
    }
    
    /// 判断哈希表中是否存在key
    ///
    /// - Parameter key: key description
    /// - Returns: return value description
    func contains(key:K) -> Bool {
        return self.lienkedTables[self.hash(key: key)].contains(key: key)
    }
    
    /// 获取某个key对应的value
    ///
    /// - Parameter key: key description
    /// - Returns: return value description
    func get(key:K) -> V? {
        return self.lienkedTables[self.hash(key: key)].get(key: key)
    }
    
    /// 删除某个键值对
    ///
    /// - Parameter key: key description
    /// - Returns: return value description
    func remove(key:K) -> V? {
        /// 再哈希表里面获取对key哈希处理后的链表
        let linked = self.lienkedTables[hash(key: key)]
        var data:V?
        if linked.contains(key: key) {
            data =  linked.remove(key: key)
            self.size -= 1
            
            /// 用静态数组实现时进行缩容
            if self.size < self.lowerTol*M && capacityIndex - 1 > 0 {
                capacityIndex -= 1
                self.resize(newM: self.capacitys[self.capacityIndex])
            }
        }
        return data
    }
    
    var debugDescription: String {
        var str = "["
        for item in self.lienkedTables {
            str.append(item.debugDescription+",\n")
        }
        return str + "]"
    }
    
    func resize(newM:Int) {
        print("开始扩展容量----\(newM)")
        var newLienkedTables=Array<LinkedList<K,V>>()
        for _ in 0..<newM {
            newLienkedTables.append(LinkedList<K,V>())
        }
        let oleM = self.M
        self.M = newM
        for i in 0..<oleM {
            let map = self.lienkedTables[i]
            for key in map.allKeys() ?? [] {
                if let v = map.get(key: key)  {
                    
                    newLienkedTables[hash(key: key)].add(key: key, value: v)
                }
            }
        }
        self.lienkedTables = newLienkedTables
    }
}

