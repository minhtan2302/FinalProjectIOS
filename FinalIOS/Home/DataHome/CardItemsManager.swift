//
//  CardItemsManager.swift
//  FinalIOS
//
//  Created by Tân Phù on 09/08/2022.
//

import Foundation

class CardItemsManager {
    // Properties
    private var cartItems: [CardItem] = []
    
    
    // Init
    init() {}
        
    // Methods
    func addItem(item: CardItem) {
        // 1. Kiem tra neu chua ton tai
        // Thi append
//        }
        // Check ID in carItems = ID item
        let object: CardItem? = cartItems.first { subItem in
            subItem.product.id == item.product.id
        }
//        print("Amout 1: \(object?.amout)")
//        object?.amout = 10
//        print("Amout 2: \(object?.amout)")
//
//        var object2: CardItem? = cartItems.first { subItem in
//            subItem.product.id == item.product.id
//        }
//        print("Amout 3: \(object2?.amout)")
//        object2?.amout = 5
//
//        print("Amout 4: \(object2?.amout)")
//        print("Amout 5: \(object?.amout)")
        
        if let objectNotNul = object {
            // ton tai
            print("Da Ton Tai")
            objectNotNul.amout = objectNotNul.amout + item.amout
        } else {
            // chua ton tai
            cartItems.append(item)
        }
    }
    
    func replaceItem(item: CardItem) {
        
    }
    
    func deleteItem(item: CardItem) {
//        cartItems.removeAll()
    }
    
    func removeData() {
        cartItems.removeAll()
    }
    
    func getList() -> [CardItem] {
        return cartItems
        
    }
    
    func calculateTotalPrice() -> Double {
        var totals: Double = 0.0
        for item in cartItems {
            let totalTtem = Double(item.amout) * item.product.priceProduct
            
            totals = totals + totalTtem
        }
        print("Total: \(totals)")
        return totals
    }
}

class OrderTransactionManager {
    
    var historyOrder: [OrderTransaction] = []
    
    func addHistory() {
        let itemCart: [CardItem] = cardItemManager.getList()
        let total = cardItemManager.calculateTotalPrice()
        let item: OrderTransaction = OrderTransaction(cartItems: itemCart,totalItems: total, paymentDate: Date.now)
        historyOrder.append(item)
    }
    
    func listOrder() -> [OrderTransaction] {
        return historyOrder
    }
    
}

class ProductFavoriteManager{
    var productFavorite: [FavoriteItem] = []
    
    func addFavorite(item: FavoriteItem) {
        let object: FavoriteItem? = productFavorite.first { subItem in
            subItem.productFavorite.id == item.productFavorite.id
        }
        if let objectNotNull = object {
            print("Da ton tai")
        }else {
            productFavorite.append(item)
        }
    }
    func listFavorite() -> [FavoriteItem] {
        return productFavorite
    }
}
