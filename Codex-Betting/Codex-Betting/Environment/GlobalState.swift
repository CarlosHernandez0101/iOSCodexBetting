//
//  GlobalState.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 13/05/22.
//

import Foundation
import Combine

protocol GlobalStateProtocol {
    var userSession: CurrentValueSubject<UserSession?, Never> { get }
}

struct GlobalState: GlobalStateProtocol {
    let userSession = CurrentValueSubject<UserSession?, Never>(nil)
}

struct GlobalStateStub: GlobalStateProtocol {
    var userSession = CurrentValueSubject<UserSession?, Never>(nil)
}

protocol GlobalStateInjector {
    var globalState: GlobalStateProtocol { get }
}

private let sharedAppDataManager: GlobalStateProtocol = GlobalState()

extension GlobalStateInjector {
    var globalState: GlobalStateProtocol {
        return sharedAppDataManager
    }
}
