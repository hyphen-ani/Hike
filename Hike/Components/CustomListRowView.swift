//
//  CustomListRowView.swift
//  Hike
//
//  Created by Hallucinate Labs on 23/06/24.
//

import SwiftUI


    //MARK: - PROPERTIES



struct CustomListRowView: View {
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    
    var body: some View {
        LabeledContent{
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                .fontWeight(.heavy)
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        } label : {
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List() {
        CustomListRowView(rowLabel: "Designes", rowIcon: "paintpalette", rowContent: "John Doe", rowTintColor: .pink)
    }
}
