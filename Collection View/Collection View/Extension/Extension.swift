//
//  Extension.swift
//  Collection View
//
//  Created by Berkay Kuzu on 11.06.2023.
//

import Foundation

extension String { // we convert String to URL.
    var asUrl: URL? {
        return URL(string: self)
    }
}
