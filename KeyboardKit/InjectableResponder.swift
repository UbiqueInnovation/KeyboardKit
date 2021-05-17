// Douglas Hill, December 2019

import UIKit

public protocol ResponderChainInjection: NSObjectProtocol {
    func nextResponderForResponder(_ responder: UIResponder) -> UIResponder?
}

open class InjectableResponder: UIResponder {
    private unowned var owner: ResponderChainInjection

    init(owner: ResponderChainInjection) {
        self.owner = owner
        super.init()
    }

    open override var next: UIResponder? {
        owner.nextResponderForResponder(self)
    }
}
