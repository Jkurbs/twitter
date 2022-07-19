//
//  Login.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//


import SwiftUI
import Combine

struct SignUpView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Header
                CredentialsForm
                Spacer()
                CallToAction
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.theme.primary)
            .navigationBarHidden(true)
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(authViewModel: AuthViewModel())
            .previewDevice("iPhone 13 Pro Max")
    }
}

extension SignUpView {
    private var Header: some View {
        Image("logo")
            .resizable()
            .frame(width: 22, height: 20)
            .scaledToFit()
    }
    
    private var CredentialsForm: some View {
        VStack(spacing: 0) {
            Text("See what's happening\nin the world right now.")
                .font(Font.system(size: 28))
                .fontWeight(.bold)
                .frame(height: 80)
                .multilineTextAlignment(.center)
            Text("Create an account to get started.")
                .foregroundColor(Color.theme.label)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
            BottomBorderTextField(placeholder: "Username", value: $authViewModel.username)
            BottomBorderTextField(placeholder: "Email address", value: $authViewModel.emailAddress)
            BottomBorderTextField(placeholder: "Password", value: $authViewModel.password)
        }.padding(.horizontal, 60)
        .padding(.top, 100)
    }
    
    private var CallToAction: some View {
        VStack {
            VStack {
                BlackButton(title: "Create account")
                    .onTapGesture {
                        // TODO: - change button opacity on tap
                        //  authViewModel.signIn()
                    }
                Text("By signing up, you agree to\nour terms, privacy policy and cookie uses.")
                    .foregroundColor(Color.theme.secondaryLabel)
                    .font(Font.system(size: 13))
                    .multilineTextAlignment(.center)
            }
            Spacer()
            NavigationLink(destination: SignInView(authViewModel: self.authViewModel)) {
                Text("Already have an account? Sign In")
                    .foregroundColor(Color.theme.secondary)
                    .font(.system(size: 13))
            }
        }.padding([.horizontal, .top], 60)
    }
}
