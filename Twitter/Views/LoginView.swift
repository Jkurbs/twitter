//
//  Login.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 22, height: 22)
                .scaledToFit()
            VStack(spacing: 10) {
                Text("See what's happening\nin the world right now.")
                    .font(Font.system(size: 30))
                    .fontWeight(.semibold)
                    .padding(.top, 200)
                Text("To get started you can log in with Twitter")
                    .foregroundColor(Color.theme.label)
            }
            Spacer()
            VStack {
                HStack(alignment: .center, spacing: 15, content: {
                    Text("Login with Twitter")
                        .foregroundColor(Color.theme.quaternaryLabel)
                        .fontWeight(.medium)
                    Image("logoWhite")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .scaledToFit()
                })
                .frame(width: 300, height: 44, alignment: .center)
                .background(Color.theme.secondary)
                .cornerRadius(8)
                .onTapGesture {
                    // TODO: - initiate twitter signIn
                    print("On tapped")
                }
                Text("By signing up, you agree to\nour terms, privacy policy and cookie uses.")
                    .foregroundColor(Color.theme.secondaryLabel)
                    .font(Font.system(size: 13))
                    .multilineTextAlignment(.center)
                    
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.theme.primary)
    }
    
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
