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

struct UserDefaultKeysOrder {
    static let ORDER_LIST = "ORDER_LIST"
}

class OrderTransactionManager {
        
    func addHistory() {
        
        var historyOrder: [OrderTransaction] = UserDefaultAccessor.shared.getObjects(type: OrderTransaction.self, key: UserDefaultKeysOrder.ORDER_LIST)
        
        let itemCart: [CardItem] = cardItemManager.getList()
        let total = cardItemManager.calculateTotalPrice()
        let item: OrderTransaction = OrderTransaction(cartItems: itemCart,totalItems: total, paymentDate: Date.now)
        
        historyOrder.append(item)
        UserDefaultAccessor.shared.saveObject(historyOrder, forKey: UserDefaultKeysOrder.ORDER_LIST)
    }
    
    func listOrder() -> [OrderTransaction] {
        let order: [OrderTransaction] = UserDefaultAccessor.shared.getObjects(type: OrderTransaction.self, key: UserDefaultKeysOrder.ORDER_LIST)
        return order
    }
    
}

struct UserDefaultKeysFavorite {
    static let FAVORITE_LIST = "FAVORITE_LIST"
}

class ProductFavoriteManager {
    
    func addFavorite(item: FavoriteItem) {
        // Lay danh sach favorite hien tai
        var favorites: [FavoriteItem] = UserDefaultAccessor.shared.getObjects(type: FavoriteItem.self, key: UserDefaultKeysFavorite.FAVORITE_LIST)
        // Tim xem item.id đã được thêm vào chưa
        
        let index: Int? = favorites.firstIndex { subItem in
            subItem.productFavorite.id == item.productFavorite.id
        }

        if let indexNotNull = index {
            print("Da Ton Tai")
            favorites.remove(at: indexNotNull)
        } else {
            favorites.append(item)
        }
        UserDefaultAccessor.shared.saveObjects(favorites, forKey: UserDefaultKeysFavorite.FAVORITE_LIST)
    }
    
    func listFavorite() -> [FavoriteItem] {
        let favorites: [FavoriteItem] = UserDefaultAccessor.shared.getObjects(type: FavoriteItem.self, key: UserDefaultKeysFavorite.FAVORITE_LIST)
        return favorites
    }
}
