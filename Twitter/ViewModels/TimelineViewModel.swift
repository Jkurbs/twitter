//
//  TimelineView.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//

import Combine
import Foundation

class TimelineViewModel: ObservableObject {
    
    @Published var tweets: [Tweet]? = nil
    
    init() {
        loadTimeline()
    }
    
    func loadTimeline() {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            self.tweets = TwitterClient.shared.loadTimeline()
        }
    }
}
