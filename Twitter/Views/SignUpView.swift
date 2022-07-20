//
//  Login.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//


import SwiftUI
import Combine

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel = SignUpViewModel()
    @State var buttonDisabled: Bool = true
    @State var buttonOpacity: Double = 0.5
    @State var isLoading: Bool = false
    
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
        SignUpView(viewModel: SignUpViewModel())
            .previewDevice("iPhone 13 Pro Max")
    }
}

// MARK: - Extension
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
            BottomBorderTextField(placeholder: "Username", value: $viewModel.username)
            BottomBorderTextField(placeholder: "Email address", value: $viewModel.emailAddress)
            BottomBorderTextField(placeholder: "Password", value: $viewModel.password, isSecure: true)
        }.padding(.horizontal, 60)
            .padding(.top, 100)
    }
    
    private var CallToAction: some View {
        VStack {
            VStack {
                VStack {
                    // TODO: - Implement a simple text with slick animation to show error messages
                    ForEach(viewModel.validationMessages, id: \.self) { msg in
                        Text(msg)
                            .foregroundColor(.red)
                            .font(.callout)
                    }
                }
                NavigationLink(destination: FeedView(), isActive: $viewModel.navigationAllowed) {
                    BlackButton(title: "Create account", isLoading: isLoading)
                        .opacity(buttonOpacity)
                        .disabled(buttonDisabled)
                        .onTapGesture {
                            isLoading = true
                            viewModel.signUp()
                        }
                        .onReceive(viewModel.submitAllowed) { submitAllowed in
                            self.buttonDisabled = !submitAllowed
                            self.buttonOpacity = submitAllowed ? 1.0 : 0.5
                        }
                }
                Text("By signing up, you agree to\nour terms, privacy policy and cookie uses.")
                    .foregroundColor(Color.theme.secondaryLabel)
                    .font(Font.system(size: 13))
                    .multilineTextAlignment(.center)
            }
            Spacer()
            NavigationLink(destination: SignInView()) {
                Text("Already have an account? Sign In")
                    .foregroundColor(Color.theme.secondary)
                    .font(.system(size: 13))
            }
        }.padding([.horizontal, .top], 60)
    }
}
