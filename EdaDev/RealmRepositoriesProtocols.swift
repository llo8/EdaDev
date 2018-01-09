//
//  RealmStorageProtocols.swift
//  TestSML
//
//  Created by Юрий on 17.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import RealmSwift

protocol RealmBase {
    associatedtype Entity: Object
    var realm: Realm { get }
}

extension RealmBase {
    var realm: Realm {
       return try! Realm()
    }
}

protocol RealmGetAll: RealmBase {
    func getAll() -> [Entity]
}
extension RealmGetAll {
    func getAll() -> [Entity] {
       return Array(realm.objects(Entity.self))
    }
}

protocol RealmSaveOne: RealmBase {
    func save(_ object: Entity) -> Entity
}
extension RealmSaveOne {
    func save(_ object: Entity) -> Entity {
        try! realm.write {
            realm.add(object, update: true)
        }
        return object
    }
}

protocol RealmRemoveOne: RealmBase {
    func remove(_ valuePimaryKey: String)
}
extension RealmRemoveOne {
    func remove(_ valuePimaryKey: String) {
        try! realm.write {
            realm.delete(realm.objects(Entity.self).filter("descriptionProduct=%@", valuePimaryKey))
        }
    }
}

protocol RealmSaveMany: RealmBase {
    func save(_ objects: [Entity]) -> [Entity]
}
extension RealmSaveMany {
    func save(_ objects: [Entity]) -> [Entity] {
        try! realm.write {
            realm.delete(realm.objects(Entity.self))
            realm.add(objects)
        }
        return objects
    }
}
