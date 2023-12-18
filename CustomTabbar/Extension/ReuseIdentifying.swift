//
//  ReuseIdentifying.swift
//  CustomTabbar
//
//  Created by siyeon park on 2023/12/15.
//

protocol ReuseIdentifying: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
