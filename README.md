# HashTable_LinkedList

### Hash表也称散列表，也有直接译作哈希表
Hash表是一种特殊的**数据结构**，它同数组、链表以及二叉排序树等相比较有很明显的区别，它能够快速定位到想要查找的记录，而不是与表中存在的记录的关键字进行比较来进行查找。这个源于Hash表设计的特殊性，它采用了`函数映射的思想将记录的存储位置与记录的关键字关联`起来，从而能够很快速地进行查找。
### 哈希函数
对比之前的`搜索树`，它们的查找都是先从`根节点`进行查找，从节点取出数据或索引与查找值进行比较。那么，有没有一种函数H，根据这个函数和查找关键字key，可以直接确定查找值所在位置，而不需要一个个比较。这样就**预先知道**key所在的位置，直接找到数据，提升效率。 
即 
`地址index=H（key）` 
说白了，`hash函数就是根据key计算出应该存储地址的位置`，而哈希表是基于哈希函数建立的一种查找表
<!-- more -->
### 哈希函数的构造方法
根据前人经验，统计出如下几种常用hash函数的构造方法： 
- 直接定制法 
`哈希函数为关键字的线性函数如 H（key）=a*key+b!这种构造方法比较简便，均匀，但是有很大限制，仅限于地址大小=关键字集合的情况 `
- 数字分析法 
`假设关键字集合中的每个关键字key都是由s位数字组成（k1,k2,……,knk1,k2,……,kn）,分析key中的全体数据，并从中提取分布均匀的若干位或他们的组合构成全体`

- 平方取中法 
`如果关键字的每一位都有某些数字重复出现频率很高的现象，可以先求关键字的平方值，通过平方扩大差异，而后取中间数位作为最终存储地址。 `

- 折叠法 
`如果数字的位数很多，可以将数字分割为几个部分，取他们的叠加和作为hash地址 `

- 除留余数法用的较多 **取模法**
`H（key）=key MOD p （p<=m m为表长）` 
`一边来说模一个质素`
首先来说假如关键字是随机分布的，那么无所谓一定要模质数。但在实际中往往关键字有某种规律，例如大量的等差数列，那么公差和模数不互质的时候发生碰撞的概率会变大，而用质数就可以很大程度上回避这个问题。

### hash函数设计的考虑因素
1. 计算散列地址所需要的时间（即hash函数本身不要太复杂） 
2. 关键字的长度 
3. 表长 
4. 关键字分布是否均匀，是否有规律可循 
5. 设计的hash函数在满足以上条件的情况下尽量减少冲突

### 哈希冲突
```swift
即不同key值产生相同的地址，H（key1）=H（key2） 
比如我们上面说的存储3 6 9，p取3是 
3 MOD 3 == 6 MOD 3 == 9 MOD 3 
此时3 6 9都发生了hash冲突
```

### 哈希冲突的解决方案
不管hash函数设计的如何巧妙，总会有特殊的key导致hash冲突，特别是对动态查找表来说。 
hash函数解决冲突的方法有以下几个常用的方法 
1. 开放定制法 
2. 链地址法 
3. 公共溢出区法 
建立一个特殊存储空间，专门存放冲突的数据。此种方法适用于数据和冲突较少的情况。 
4. 再散列法 
准备若干个hash函数，如果使用第一个hash函数发生了冲突，就使用第二个hash函数，第二个也冲突，使用第三个…… 
重点了解一下开放定制法和链地址法

#### 链地址法
产生hash冲突后在存储数据后面加一个指针，指向后面冲突的数据 

{% asset_img 20180520012305597.png %}

#### 模

lwr|upr|% err|prime
---- | ------- | ------|---
2^5|2^6|10.416667 |53
2^6|2^7|1.041667  |97
2^7|2^8|0.520833  |193
2^8|2^9|1.302083  |389
2^9|2^10|0.130208 |769
2^10|2^11|0.455729|1543
2^11|2^12|0.227865|3079
2^12|2^13|0.113932|6151
2^13|2^14|0.008138|12289
2^14|2^15|0.069173|24593
2^15|2^16|0.010173|49157
2^16|2^17|0.013224|98317
2^17|2^18|0.002543|196613
2^18|2^19|0.006358|393241
2^19|2^20|0.000127|786433
2^20|2^21|0.000318|1572869
2^21|2^22|0.000350|3145739
2^22|2^23|0.000207|6291469
2^23|2^24|0.000040|12582917
2^24|2^25|0.000075|25165843
2^25|2^26|0.000010|50331653
2^26|2^27|0.000023|100663319
2^27|2^28|0.000009|201326611
2^28|2^29|0.000001|402653189
2^29|2^30|0.000011|805306457
2^30|2^31|0.000000|1610612741