//
//  MetaTextResignedFirstResponderHandler
//  RxSwiftForms
//
//  Created by Michael Long on 3/19/18.
//  Copyright © 2018 Hoy Long. All rights reserved.
//

import UIKit

public class MetaTextResignedFirstResponderHandler: MetaTextBehaviorResponding {

    public static let name = "MetaTextResignedFirstResponderHandler"

    public var name: String? { return nil } // Allow more than one
    public var priority: MetaTextPriority { return .low }

    internal weak var textField: MetaTextField?
    internal let handler: (_ textField: MetaTextField) -> Void

    init(_ handler: @escaping (_ textField: MetaTextField) -> Void) {
        self.handler = handler
    }

    public func add(to textField: MetaTextField) -> Bool {
        self.textField = textField
        return true
    }

    public var canBecomeFirstResponder: Bool? {
        return nil
    }

    public func responder(status: MetaTextResponderStatus) {
        guard let textField = textField else { return }
        if status == .resignedFirst {
            handler(textField)
        }
    }
}