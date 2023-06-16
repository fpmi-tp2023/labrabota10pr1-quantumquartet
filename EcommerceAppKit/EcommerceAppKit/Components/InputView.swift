//
//  InputView.swift
//  EcommerceAppKit
//
//  Created by Xenia on 14.06.2023.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.custom(customFont, size: 14))
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.custom(customFont, size: 14))
            } else {
                TextField(placeholder, text: $text)
                    .font(.custom(customFont, size: 14))
            }
            
            Divider()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Email Adress", placeholder: "ivanov@example.com")
    }
}
