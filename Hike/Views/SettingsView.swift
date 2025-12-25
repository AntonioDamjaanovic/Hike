//
//  SettingsView.swift
//  Hike
//
//  Created by Antonio Damjanović on 25.12.2025..
//

import SwiftUI

struct SettingsView: View {
    
    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Campfire",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Mushroom"
    ]
    
    var body: some View {
        List {
            // MARK: - HEADER
            Section {
                HStack {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium,
                            .customGreenDark
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeus in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            } //: HEADER
            .listRowSeparator(.hidden)
            
            // MARK: - ICONS
            Section(
                header: Text("Alternate Icons")
            ) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                print("icon \(alternateAppIcons[item]) was pressed")
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if error != nil {
                                        print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Success!")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                } //: SCROLL VIEW
                .padding(.top, 12)
                
                Text("Choos your favourite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            }
            .listRowSeparator(.hidden)
            
            // MARK: - ABOUT
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright @ All rights reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                // LabeledContent("Application", value: "Hike")
                CustomListRowView(label: "Application", icon: "apps.iphone", content: "HIKE", tintColor: .blue)
                
                CustomListRowView(label: "Compatibility", icon: "info.circle", content: "iOS, iPadOS", tintColor: .red)
                
                CustomListRowView(label: "Technology", icon: "swift", content: "Swift", tintColor: .orange)
                
                CustomListRowView(label: "Version", icon: "gear", content: "1.0", tintColor: .purple)
                
                CustomListRowView(label: "Developer", icon: "ellipsis.curlybraces", content: "Antonio Damjanović", tintColor: .mint)
                
                CustomListRowView(label: "Designer", icon: "paintpalette", content: "Robert Petras", tintColor: .pink)
                
                CustomListRowView(label: "Website", icon: "globe", tintColor: .indigo, linkLabel: "Credo Academy", linkDestination: "https://credo.academy")
                
            } //: SECTION
            
        } //: LIST
        
    }
}

#Preview {
    SettingsView()
}
