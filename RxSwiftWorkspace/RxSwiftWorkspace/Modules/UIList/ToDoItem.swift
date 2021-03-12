//
//  Model.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2021/3/11.
//  Copyright © 2021 lym. All rights reserved.
//

import Foundation

extension Notification {
    struct UserInfoKey<ValueType>: Hashable {
        let key: String
    }

    func getUserInfo<T>(for key: Notification.UserInfoKey<T>) -> T {
        return userInfo![key] as! T
    }
}

extension Notification.Name {
    static let toDoStoreDidChangedNotification = Notification.Name(rawValue: "com.onevcat.app.ToDoStoreDidChangedNotification")
}

extension Notification.UserInfoKey {
    static var toDoStoreDidChangedChangeBehaviorKey: Notification.UserInfoKey<ToDoStore.ChangeBehavior> {
        return Notification.UserInfoKey(key: "com.onevcat.app.ToDoStoreDidChangedNotification.ChangeBehavior")
    }
}

extension NotificationCenter {
    func post<T>(name aName: NSNotification.Name, object anObject: Any?, typedUserInfo aUserInfo: [Notification.UserInfoKey<T>: T]? = nil) {
        post(name: aName, object: anObject, userInfo: aUserInfo)
    }
}

struct ToDoItem {
    typealias ItemId = UUID

    let id: ItemId
    let title: String

    init(title: String) {
        id = ItemId()
        self.title = title
    }
}

class ToDoStore {
    enum ChangeBehavior {
        case add([Int])
        case remove([Int])
        case reload
    }

    static let shared = ToDoStore()

    static func diff(original: [ToDoItem], now: [ToDoItem]) -> ChangeBehavior {
        let originalSet = Set(original)
        let nowSet = Set(now)

        if originalSet.isSubset(of: nowSet) { // Appended
            let added = nowSet.subtracting(originalSet)
            let indexes = added.compactMap { now.firstIndex(of: $0) }
            return .add(indexes)
        } else if nowSet.isSubset(of: originalSet) { // Removed
            let removed = originalSet.subtracting(nowSet)
            let indexes = removed.compactMap { original.firstIndex(of: $0) }
            return .remove(indexes)
        } else { // Both appended and removed
            return .reload
        }
    }

    private var items: [ToDoItem] = [] {
        didSet {
            let behavior = ToDoStore.diff(original: oldValue, now: items)
            NotificationCenter.default.post(
                name: .toDoStoreDidChangedNotification,
                object: self,
                typedUserInfo: [.toDoStoreDidChangedChangeBehaviorKey: behavior]
            )
        }
    }

    private init() {}

    func append(item: ToDoItem) {
        items.append(item)
    }

    func append(newItems: [ToDoItem]) {
        items.append(contentsOf: newItems)
    }

    func remove(item: ToDoItem) {
        guard let index = items.firstIndex(of: item) else { return }
        remove(at: index)
    }

    func remove(at index: Int) {
        items.remove(at: index)
    }

    func edit(original: ToDoItem, new: ToDoItem) {
        guard let index = items.firstIndex(of: original) else { return }
        items[index] = new
    }

    var count: Int {
        return items.count
    }

    func item(at index: Int) -> ToDoItem {
        return items[index]
    }
}

extension ToDoItem: Hashable {
    //'Hashable.hashValue' is deprecated as a protocol requirement; conform type 'ToDoItem' to 'Hashable' by implementing 'hash(into:)' instead
//    var hashValue: Int {
//        return id.hashValue
//    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}

extension ToDoItem: Equatable {
    public static func == (lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        return lhs.id == rhs.id
    }
}
