//
//  contact.swift
//  BasicContactApp
//
//  Created by Jacob Aguilar on 21-04-21.
//

import Foundation

struct Contact: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String = ""
}
