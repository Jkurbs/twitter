//
//  SignInView.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//

import SwiftUI

struct SignInView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var authViewModel: AuthViewModel
    @State var emailAddress: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Header
            CredentialsForm
            Spacer()
            CallToAction
            Spacer()
                .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
        }
        .background(Color.theme.primary)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(authViewModel: AuthViewModel())
            .previewDevice("iPhone 13 Pro Max")
    }
}

extension SignInView {
    
    private var Header: some View {
        Image("logo")
            .resizable()
            .frame(width: 22, height: 20)
            .scaledToFit()
    }
    
    private var CredentialsForm: some View {
        VStack(spacing: 0) {
            Text("To Sign In\nEnter your email address and password")
                .font(Font.system(size: 28))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .frame(height: 150)
            BottomBorderTextField(placeholder: "Email address", value: $authViewModel.emailAddress)
            BottomBorderTextField(placeholder: "Password", value: $authViewModel.password)
        }.padding(.horizontal, 60)
            .padding(.top, 100)
    }
    
    private var CallToAction: some View {
        VStack {
            VStack {
                BlackButton(title: "Sign In")
                    .onTapGesture {
                        // TODO: - change button opacity on tap
                        //  authViewModel.signIn()
                    }
            }
            Spacer()
            NavigationLink(destination: SignInView(authViewModel: self.authViewModel)) {
                Text("Don't have an account? Create account")
                    .foregroundColor(Color.theme.secondary)
                    .font(.system(size: 13))
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
        }.padding([.horizontal, .top], 60)
    }
}
