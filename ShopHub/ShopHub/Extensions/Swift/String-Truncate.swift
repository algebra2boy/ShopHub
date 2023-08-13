//
//  String-Truncate.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/12/23.
//

import Foundation

extension String {
    func truncate(to maxLength: Int, addEllipsis: Bool = true) -> String {
        var words = self.components(separatedBy: " ")
        if words.count > maxLength {
            words = Array(words.prefix(maxLength))
            if addEllipsis {
                return words.joined(separator: " ") + "..."
            }
        }
        return words.joined(separator: " ")
    }
}
