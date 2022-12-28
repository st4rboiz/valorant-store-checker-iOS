//
//  WeaponCardDetailView.swift
//  ValorantStoreChecker
//
//  Created by Gordon Ng on 2022-07-17.
//

import SwiftUI

//import GoogleMobileAds



struct SkinCardDetailView: View {
    
    @EnvironmentObject var skinModel:SkinModel
    @EnvironmentObject var authAPIModel : AuthAPIModel
    @ObservedObject var skin:Skin
    
    @State var selectedLevel = 0
    @State var selectedChroma = 0
    @State var price = ""
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: UIScreen.main.bounds.height / 40) {
            
            TitleView(skin: skin)
            
            VStack {
                
                // MARK: Price
                PriceView(skin: skin, price: price)
                
                
                // MARK: Videos
                if skin.levels!.count != 1 {
                    
                    Divider()
                        .padding(.leading)
                    
                    VideoView(skin: skin, selectedLevel: $selectedLevel)
                        .padding()
                    
                    Divider()
                        .padding(.leading)
                    
                    VideoPickerView(skin: skin, selectedLevel: $selectedLevel)
                }
                
                Divider()
                    .padding(.leading)
                
                ChromaView(skin: skin, selectedChroma: $selectedChroma)
                
                if skin.chromas!.count != 1{
                    
                    Divider()
                        .padding(.leading)
                    
                    ChromaPickerView(skin: skin, selectedChroma: $selectedChroma)
                    
                }
            }
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
            
            
            Spacer()
        }
        .ignoresSafeArea(.all)
        .padding()
        .onAppear{
            self.selectedLevel = getCorrectIndex(skin: skin)
        }
        
    }
}

// Helper Function
func getCorrectIndex(skin: Skin) -> Int {
    
    var index: Int = 0
    
    for level in skin.levels! {
        
        if level.streamedVideo != nil {
            return index
        }
        
        index += 1
    }
    
    return 0
    
}




