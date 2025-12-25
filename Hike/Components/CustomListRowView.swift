//
//  CustomListRowView.swift
//  Hike
//
//  Created by Antonio Damjanović on 25.12.2025..
//

import SwiftUI

struct CustomListRowView: View {
    
    @State var label: String
    @State var icon: String
    @State var content: String? = nil
    @State var tintColor: Color
    @State var linkLabel: String? = nil
    @State var linkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            if content != nil {
                Text(content!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            } else if linkLabel != nil && linkDestination != nil {
                Link(linkLabel!, destination: URL(string: linkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            } else {
                EmptyView()
            }
 
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(tintColor)
                    
                    Image(systemName: icon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                
                Text(label)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            label: "Website",
            icon: "globe",
            content: nil,
            tintColor: .pink,
            linkLabel: "Credo Academy",
            linkDestination: "https://credo.academy"
        )
    }
}
