//
//  SettingsView.swift
//  Hike
//
//  Created by Hallucinate Labs on 23/06/24.
//

import SwiftUI

struct SettingsView: View {
    
    //MARK: - PROPERTIES
    
    private let alternateAppIcons: [String] = ["AppIcon-MagnifyingGlass", "AppIcon-Map", "AppIcon-Mushroom", "AppIcon-Camera", "AppIcon-Backpack", "AppIcon-Campfire"]
    
    var body: some View {
        List{
            
            Section{
                
                
                //MARK: Section Header
                HStack{
                    
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editors Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }.foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium, .customGreenDark], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding(.top, 8)
                
                VStack(spacing: 8){
                    Text("Where Can You Find \nPerfect Tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
            }
            
            .listRowSeparator(.hidden)
            
            //MARK: Section Icons
            
            Section(header: Text("Alternate Icons")){
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing:12) {
                        ForEach(alternateAppIcons.indices, id:\.self) { item in
                            Button {
                                print("Icon \(alternateAppIcons[item]) Was Pressed")
                                
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) {
                                    error in
                                    
                                    if error != nil {
                                        print("Failed Request to update the app's icon: \(String(describing: error?.localizedDescription))")
                                    }else{
                                        print("Sucess, You Have Changes to \(alternateAppIcons[item])")
                                    }
                                }
                                
                            }label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 90)
                                    .cornerRadius(18)
                                
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                }//: SCROLL VIEW
                .padding(.top, 12)
                
                Text("Let's Change How It Looks")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            } //: SECTION
            .listRowSeparator(.hidden)
            
            
            //MARK: Section About
            
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    Text("Copyright, All Right Reserved")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ){
                //1. Basic Labelled Content
                
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibiity", rowIcon: "info.circle", rowContent: "iOS/iPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Hallucinate Labs", rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Hallucinate Labs", rowLinkDestination: "https://google.com")
            }
        }//: List

        
        
    }
}

#Preview {
        SettingsView()
}
