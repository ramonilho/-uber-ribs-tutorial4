//
//  LoggedInActionableItem.swift
//  TicTacToe
//
//  Created by Ramon Honorio on 09/05/19.
//  Copyright © 2019 Uber. All rights reserved.
//

import RxSwift

public protocol LoggedInActionableItem: class {
    func launchGame(with id: String?) -> Observable<(LoggedInActionableItem, ())>
}
