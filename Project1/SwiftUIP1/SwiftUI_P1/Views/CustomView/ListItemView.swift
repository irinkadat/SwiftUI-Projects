//
//  ListItemView.swift
//  SwiftUI_P1
//
//  Created by Irinka Datoshvili on 22.05.24.
//

import SwiftUI

struct ListItemView: View {
    // MARK: - Properties
    var data: ListItemData
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image("invoice")
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .background(Color(red: 0.42, green: 0.78, blue: 0.99))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 0) {
                Text(data.title)
                    .fontWeight(.bold)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                Text(data.text)
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.leading, 16)
            .padding(.trailing, 24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(EdgeInsets(top: 15, leading: 16, bottom: 8, trailing: 16))
        .frame(height: 60)
        .background(Color(red: 25/255, green: 37/255, blue: 43/255))
        .frame(maxWidth: .infinity)
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleData = sampleItems[0]
        ListItemView(data: sampleData)
    }
}
