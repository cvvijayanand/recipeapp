//
//  ContentView.swift
//  Recipe List App
//
//  Created by Vijayanand Chinnakannan on 2021-02-11.
//

import SwiftUI

struct RecipeListView: View {

    //Reference the view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationView {
            List(model.recipes) {r in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {
                        
                        //MARK: Row Item

                        HStack(spacing: 20) {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipped()
                                .cornerRadius(5)
                            Text(r.name)
                        } //End of Image and Name HStack
                        
                    })
            }//End of List View
            .navigationBarTitle("All Recipes")
        }//End of Navigation View
    }//End of Body property
}//end of Struct

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
