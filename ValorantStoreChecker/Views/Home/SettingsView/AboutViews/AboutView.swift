//
//  SettingsView.swift
//  ValorantStoreChecker
//
//  Created by Gordon Ng on 2022-07-16.
//

import SwiftUI

struct AboutView: View {
    
    @State var dummy = false
    let defaults = UserDefaults.standard
    
    var body: some View {
        
        Form {
            
            Section() {
                
                HStack {
                    Text("Version")
                    
                    Spacer()
                    
                    Text((Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!)
                }
                
                Button {

                    if let url = URL(string: Constants.URL.privacy) {
                        UIApplication.shared.open(url)
                    }
                    
                } label: {
                    

                    SettingItemView(itemType: "generic", name: "Privacy", iconBG: .blue, iconColour: .white, image: "hand.raised.fill", showChevron: true, toggleBool: $dummy)
                }
                
                NavigationLink {
                    TermsView()
                } label: {
                    SettingItemView(itemType: "generic", name: "TermsAndConditions", iconBG: .green, iconColour: .white, image: "list.bullet.rectangle.portrait.fill", toggleBool: $dummy)
                }
                
            }
            
            Section(header: Text("WhatsNew")) {
                
                
                let releaseNotes = defaults.array(forKey: "releaseNotes") as? [String] ?? []
                ForEach(1...releaseNotes.count, id: \.self) { index in
                    HStack{
                        Text(String(index) + ".")
                            .padding(.trailing)
                        
                        Text(releaseNotes[index - 1])
                        
                    }
                }
                
            }
            
            Section(header: Text("Copyright")) {
                Text(LocalizedStringKey("CopyrightNotice"))
            }
        }
        .navigationTitle(LocalizedStringKey("About"))
        
        
    }
}

struct AboutView_Previews: PreviewProvider {
    
    static var previews: some View {
        AboutView()
    }
}



