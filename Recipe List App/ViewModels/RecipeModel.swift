//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Vijayanand Chinnakannan on 2021-02-11.
//

import Foundation

class RecipeModel:ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        //Create an instance of the data service and get the data
        //let service = DataService()
        self.recipes = DataService.getLocalData()
    }
}
