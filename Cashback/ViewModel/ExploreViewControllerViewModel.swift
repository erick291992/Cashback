//
//  ExploreViewControllerViewModel.swift
//  Cashback
//
//  Created by Erick Manrique on 1/13/19.
//  Copyright © 2019 homeapps. All rights reserved.
//

import Foundation

class ExploreViewControllerViewModel: AlertGenerator {
    
    let exploreService: ExploreService
    var venues = Bindable([Venue]())
    var onShowError: ((_ alert: SingleButtonAlert) -> Void)?
    
    init() {
        self.exploreService = ExploreService()
    }
    
    func getVenues() {
        exploreService.getVenues { [weak self] (result) in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let venuesResult,_, _):
                strongSelf.venues.value = venuesResult.venues
            case .failure(_):
                let alert = strongSelf.generataAlert(alertTitle: "failure", statusCodeMessage: "responce caused error when getting venues")
                strongSelf.onShowError?(alert)
                
            }
        }
    }
    
    
}
