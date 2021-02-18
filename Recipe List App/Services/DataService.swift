//
//  DataService.swift
//  Recipe List App
//
//  Created by Vijayanand Chinnakannan on 2021-02-11.
//

import Foundation

class DataService {
    //static keyword converts the method as a data type. For calling the get local you use Class.Method directly insead of creating an instance
    //of the class ex: DataService.getLocalData. Refer init method in RecipeModel.Swift 
    
    static func getLocalData() -> [Recipe] {
        
        //Parse local json file
        
        //Get the URL path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: ".json")
        
        //Check if pathString is not nil, otherwise return an empty recipe list
        guard pathString != nil else {
            return [Recipe]()
        }
        
        //Create URL object
        let url = URL(fileURLWithPath: pathString!)
        
        //Do catch block for creating the data object from the URL
        do {
            //Create data from the url
            let data = try Data(contentsOf: url)
            
            //Decode the data with the JSON decoder
            let decoder = JSONDecoder()
            
            //Do catch block for decoding the JSON and creating recipes
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
         
                //Add the unique ID for the list view
                
                for r in recipeData {
                    r.id = UUID()
                }
                
                //Return the Recipes
                return recipeData
            }
            
            catch {
                //Catch JSON parsing error
                print(error)
            }
        }
        catch {
         //Print error if the URL has errors
            print(error)
        }
        return [Recipe]()
    }
}
