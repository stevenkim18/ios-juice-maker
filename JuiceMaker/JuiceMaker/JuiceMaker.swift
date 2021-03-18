//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Fruit: CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
}

enum FruitJuice: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case kiwi = "키위"
    case pineapple = "파인애플"
    case strawberryBanana = "딸바"
    case mango = "망고"
    case mangoKiwi = "망키"
    
    // recipe는 딕셔너리
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}

class JuiceMaker {
    var fruitStocks: [Fruit: Int] = [:]
    
    init(numberOfStocks: Int) {
        for fruit in Fruit.allCases {
            fruitStocks[fruit] = numberOfStocks
        }
    }
    func checkStock(of fruit: Fruit) -> Int {
        return fruitStocks[fruit]!
    }
    func checkStockAvailable(fruit: Fruit, requestedStock: Int) -> Bool {
        if (checkStock(of: fruit) < requestedStock) {
            return false
        }
        return true
    }
    func consumeFruit(fruit: Fruit, stock: Int) {
        fruitStocks[fruit]! -= stock
    }
    func makeFruitJuice(_ juice: FruitJuice) {
        for (ingredient, amount) in juice.recipe {
            consumeFruit(fruit: ingredient, stock: amount)
        }
    }
    func addStock(fruit: Fruit) {
        fruitStocks[fruit]! += 1
    }
}


