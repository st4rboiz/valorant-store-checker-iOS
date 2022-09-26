//
//  HomeView.swift
//  ValorantStoreChecker
//
//  Created by Gordon Ng on 2022-07-16.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var authAPIModel : AuthAPIModel
    @EnvironmentObject var skinModel : SkinModel
    @State var tabIndex = 0
    
    private let defaults = UserDefaults.standard
    
    
    var body: some View {
        
        TabView(selection: $tabIndex) {
            ShopView()
                .background(LinearGradient(gradient: Constants.bgGradient, startPoint: .top, endPoint: .bottom))
                .tabItem {
                    Image(systemName: "cart")
                    Text(LocalizedStringKey("Store"))
                }
                .tag(0)
            
            if defaults.bool(forKey: "nightMarket") || authAPIModel.nightMarket {
                NightMarketView()
                    .background(LinearGradient(gradient: Constants.bgGradient, startPoint: .top, endPoint: .bottom))
                    .tabItem{
                    Image(systemName: "moon.stars")
                    Text(LocalizedStringKey("NightMarket"))
                    }
                    .tag(4)
            }
            
            
            BundleView()
                .background(LinearGradient(gradient: Constants.bgGradient, startPoint: .top, endPoint: .bottom))
                .tabItem{
                Image(systemName: "archivebox.fill")
                Text(LocalizedStringKey("Bundle"))
                }
                .tag(1)
            
            SkinListView()
                .background(LinearGradient(gradient: Constants.bgGradient, startPoint: .top, endPoint: .bottom))
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text(LocalizedStringKey("SkinIndex"))
                }
                .tag(2)
            
            
            
            /*
             WishListView()
             .background(LinearGradient(gradient: Constants.bgGradient, startPoint: .top, endPoint: .bottom))
             .tabItem{
             Image(systemName: "heart.fill")
             Text("Wish List")
             }
             .tag(2)
             */
            
            AboutView()
                .background(LinearGradient(gradient: Constants.bgGradient, startPoint: .top, endPoint: .bottom))
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text(LocalizedStringKey("About"))
                }
                .tag(3)
            
        }
        .accentColor(.white)
        .preferredColorScheme(.dark)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
