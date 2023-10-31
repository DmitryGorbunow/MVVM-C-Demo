//
//  Bindable.swift
//  MVVM+C Demo
//
//  Created by Dmitry Gorbunow on 10/29/23.
//

import Foundation

final class Bindable<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
