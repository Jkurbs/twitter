//
//  SignInView.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//

import SwiftUI

struct SignInView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: SignInViewModel = SignInViewModel()
    
    @State var buttonDisabled: Bool = true
    @State var buttonOpacity: Double = 0.5
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack {
            Header
            CredentialsForm
            Spacer()
            CallToAction
            Spacer()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
        }
        .background(Color.theme.primary)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .previewDevice("iPhone 13 Pro Max")
    }
}

// MARK: - Extension
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
            BottomBorderTextField(placeholder: "Email address", value: $viewModel.emailAddress)
            BottomBorderTextField(placeholder: "Password", value: $viewModel.password, isSecure: true)
        }.padding(.horizontal, 60)
            .padding(.top, 100)
    }
    
    private var CallToAction: some View {
        VStack {
            VStack {
                NavigationLink(destination: FeedView(), isActive: $viewModel.navigationAllowed) {
                    BlackButton(title: "Sign In", isLoading: isLoading)
                        .opacity(buttonOpacity)
                        .disabled(buttonDisabled)
                        .onTapGesture {
                            self.isLoading = true
                            viewModel.signIn()
                        }
                        .onReceive(viewModel.submitAllowed) { submitAllowed in
                            self.buttonDisabled = !submitAllowed
                            self.buttonOpacity = submitAllowed ? 1.0 : 0.5
                        }
                }
            }
            Spacer()
            NavigationLink(destination: SignUpView()) {
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
