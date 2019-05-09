//
//  XYZRealm.swift
//  SoHow
//
//  Created by 张子豪 on 2019/3/13.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZRealm: NSObject {

}



//加密需要的字段
/// THE SOFTWARE.

//import Foundation
//import CommonCrypto
//extension String {
//    
//    /// Uses CommonCrypto framework to generate sha512 of the current string
//    var sha512: Data? {
//        let stringData = data(using: String.Encoding.utf8)!
//        var result = Data(count: Int(CC_SHA512_DIGEST_LENGTH))
//        _ = result.withUnsafeMutableBytes { resultBytes in
//            stringData.withUnsafeBytes { stringBytes in
//                CC_SHA512(stringBytes, CC_LONG(stringData.count), resultBytes)
//            }
//        }
//        
//        return result
//    }
//}

//加密Realm的过程
//private func encryptRealm() {
//    userInputAlert("Create a password to encrypt your to do list", isSecure: false) { [weak self] password in
//        // copy to a new location, encrypt, and delete old data
//        autoreleasepool {
//            let plainConfig = Realm.Configuration(
//                fileURL: TodoRealm.plain.url)
//            let realm = try! Realm(configuration: plainConfig)
//            try! realm.writeCopy(
//                toFile: TodoRealm.encrypted.url, encryptionKey: password.sha512)
//        }
//
//        do {
//            // Delete old file
//            let files = FileManager.default.enumerator(
//                at: try Path.documents(), includingPropertiesForKeys: [])!
//
//            for file in files.allObjects {
//                guard let url = file as? URL,
//                    url.lastPathComponent.hasPrefix("mytodo.") else { continue }
//                try FileManager.default.removeItem(at: url)
//            }
//        } catch let err {
//            fatalError("Failed deleting unencrypted Realm: \(err)")
//        }
//
//        self?.detectConfiguration()
//    }
//}












//1\删除Realm文件🐵

//do {
//    // Delete old file
//    let files = FileManager.default.enumerator(
//        at: try Path.documents(), includingPropertiesForKeys: [])!
//
//    for file in files.allObjects {
//        guard let url = file as? URL,
//            url.lastPathComponent.hasPrefix("mytodo.") else { continue }
//        try FileManager.default.removeItem(at: url)
//    }
//} catch let err {
//    fatalError("Failed deleting unencrypted Realm: \(err)")
//}



//2🐵🐵 RealmProvider  用于多个Realm文件

//import Foundation
//import RealmSwift
//
//struct RealmProvider {
//    let configuration: Realm.Configuration
//
//    internal init(config: Realm.Configuration) {
//        configuration = config
//    }
//
//    var realm: Realm {
//        return try! Realm(configuration: configuration)
//    }
//
//    // MARK: - Flash Cards realm
//    private static let cardsConfig = Realm.Configuration(
//        fileURL: try! Path.inLibrary("cards.realm"),
//        schemaVersion: 1,
//        deleteRealmIfMigrationNeeded: true,
//        objectTypes: [FlashCardSet.self, FlashCard.self])
//
//    public static var cards: RealmProvider = {
//        return RealmProvider(config: cardsConfig)
//    }()
//
//    // MARK: - Bundled sets
//    private static let bundledConfig = Realm.Configuration(
//        fileURL: try! Path.inBundle("bundledSets.realm"),
//        readOnly: true,
//        objectTypes: [FlashCardSet.self, FlashCard.self])
//
//    public static var bundled: RealmProvider = {
//        return RealmProvider(config: bundledConfig)
//    }()
//
//    // MARK: - Word of today
//    private static let wordOfDayConfig = Realm.Configuration(
//        fileURL: try! Path.inBundle("bundledWords.realm"),
//        readOnly: true,
//        schemaVersion: 1,
//        objectTypes: [WordOfDayList.self, Entry.self])
//
//    public static var wordOfDay: RealmProvider = {
//        return RealmProvider(config: wordOfDayConfig)
//    }()
//
//    // MARK: - Settings realm
//    private static let settingsConfig = Realm.Configuration(
//        fileURL: try! Path.inSharedContainer("settings.realm"),
//        schemaVersion: 1,
//        objectTypes: [Settings.self, Entry.self])
//
//    public static var settings: RealmProvider = {
//        if let realm = try? Realm(configuration: settingsConfig),
//            realm.isEmpty {
//            try! realm.write {
//                realm.add(Settings())
//            }
//        }
//        return RealmProvider(config: settingsConfig)
//    }()
//}



//3🐵🐵🐵 RealmProvider  初始化Realm文件的其他方法


//从一个Realm文件中拷贝Object对象到另一个Realm文件中
//private func setupRealm() {
//    let cardsRealm = RealmProvider.cards.realm
//    let bundledSetsRealm = RealmProvider.bundled.realm
//
//    var setsToCopy = [FlashCardSet]()
//    for bundledSet in bundledSetsRealm.objects(FlashCardSet.self)
//        where cardsRealm.object(
//            ofType: FlashCardSet.self,
//            forPrimaryKey: bundledSet.name) == nil {
//
//                setsToCopy.append(bundledSet)
//    }
//
//    guard setsToCopy.count > 0 else { return }
//
//    try! cardsRealm.write {
//        for cardSet in setsToCopy {
//            cardsRealm.create(FlashCardSet.self, value: cardSet, update: false)
//        }
//}

//4🐵🐵🐵🐵 Realm文件类型List的操作self.list.append(objectsIn: list)

//@objcMembers class WordOfDayList: Object {
//    let list = List<Entry>()
//
//    convenience init(list: [Entry]) {
//        self.init()
//        self.list.append(objectsIn: list)
//    }
//
//    func append(objectsIn entries: [Entry]) {
//        list.append(objectsIn: entries)
//    }
//}


// MARK: - CRUD methods
//增加(Create)、读取查询(Retrieve)、更新(Update)和删除(Delete)

// MARK:- Create--(添加)
// MARK:- Retrieve--(读取查询) All--获取所有数据
// MARK:- Update--(更新)
// MARK:- Delete--(删除)
