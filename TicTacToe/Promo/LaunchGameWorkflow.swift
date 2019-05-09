//
//  LaunchGameWorkflow.swift
//  TicTacToe
//
//  Created by Ramon Honorio on 09/05/19.
//  Copyright © 2019 Uber. All rights reserved.
//

import RIBs
import RxSwift

public class LaunchGameWorkflow: Workflow<RootActionableItem> {
    public init(url: URL) {
        super.init()
        
        let gameId = parseGameId(from: url)
        
        self
            .onStep { (rootItem: RootActionableItem) -> Observable<(LoggedInActionableItem, ())> in
                rootItem.waitForLogin()
            }
            .onStep { (loggedItem: LoggedInActionableItem, _) -> Observable<(LoggedInActionableItem, ())> in
                loggedItem.launchGame(with: gameId)
            }
            .commit()
        
    }
    
    // MARK: - Private
    private func parseGameId(from url: URL) -> String? {
        let components = URLComponents(string: url.absoluteString)
        let items = components?.queryItems ?? []
        
        for item in items {
            if item.name == "gameId" {
                return item.value
            }
        }
        
        return nil
    }
}
