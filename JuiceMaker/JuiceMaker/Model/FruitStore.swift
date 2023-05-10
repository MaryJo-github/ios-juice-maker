//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by Yetti, yy-ss99, Mary.

class FruitStore {
    private let initialStock = 10
    private(set) lazy var fruitStock: [Fruits: Int] = [
        .strawberry: initialStock, .banana: initialStock,
        .pineapple: initialStock, .mango: initialStock,
        .kiwi: initialStock
    ]
    
    func addStock(fruit: FruitNameAndAmount) {
        fruitStock[fruit.name]? += fruit.amount
    }
    
    func useStock(fruit: FruitNameAndAmount) {
        fruitStock[fruit.name]? -= fruit.amount
    }
}
