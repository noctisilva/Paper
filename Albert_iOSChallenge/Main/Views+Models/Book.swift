//
//  MainViewModel.swift
//  Albert_iOSChallenge
//
//  Created by Tae Hong Min on 7/9/19.
//  Copyright © 2019 taehongmin. All rights reserved.
//

import Foundation
import RealmSwift

// Struct codable for book
struct Book: Codable {
    let title: String?
    let author_name: [String]?
    let subject: [String]?
    let publisher: [String]?
    let language: [String]?
    let isbn: [String]?
    let first_publish_year: Int?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case author_name = "author_name"
        case subject
        case publisher
        case language
        case isbn
        case first_publish_year = "first_publish_year"
    }
}

//Realm translated object
@objcMembers class BookDBO: Object {
    dynamic var id: String?
    dynamic var title: String?
    dynamic var year: Int?
    dynamic var author_name: List<String>? = List()
    dynamic var subject : List<String>? = List()
    dynamic var publisher : List<String>? = List()
    dynamic var language : List<String>? = List()
    dynamic var isbn : List<String>? = List()
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func from(book: Book, realm: Realm) -> BookDBO {
        let book1: BookDBO = {
            let it = BookDBO()
            it.id = ("\(book.title ?? "")\(book.isbn?.first ?? "")")
            it.title = book.title
            it.year = book.first_publish_year
            it.author_name?.append(objectsIn: book.author_name ?? [])
            it.subject?.append(objectsIn: book.subject ?? [])
            it.publisher?.append(objectsIn: book.publisher ?? [])
            it.language?.append(objectsIn: book.language ?? [])
            it.isbn?.append(objectsIn: book.isbn ?? [])
            return it
        }()
        return realm.create(BookDBO.self, value: book1, update: true)
    }
    
    func toBook() throws -> Book {
        return Book(
            title: title,
            author_name: author_name.flatMap(Array.init),
            subject: subject.flatMap(Array.init),
            publisher: publisher.flatMap(Array.init),
            language: language.flatMap(Array.init),
            isbn: isbn.flatMap(Array.init),
            first_publish_year: year
        )
    }
}
