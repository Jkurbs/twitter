//
//  LogInView.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//

import SwiftUI

struct LogInView: View {
    
    @ObservedObject var authViewModel: AuthViewModel = AuthViewModel()
    @State private var buttonDisabled: Bool = true
    @State private var buttonOpacity: Double = 0.5
    
    var body: some View {
        VStack {
            CredentialsForm()
            Spacer()
            CallToAction()
            Spacer()
                .toolbar {
                    ToolbarItems()
                }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
            .previewDevice("iPhone 13 Pro Max")
    }
}

// MARK: - Extension
extension LogInView {
    
    private func CredentialsForm() -> some View {
        VStack {
            Text("To Log In, enter your\nusername and password")
                .font(Font.system(size: 28))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            BorderBottomTextField(placeholder: "Username", value: $authViewModel.username)
            BorderBottomTextField(placeholder: "Password", value: $authViewModel.password, isSecure: true)
        }.padding(.horizontal, 40)
            .padding(.top, 70)
    }
    
    private func CallToAction() -> some View {
        VStack {
            BlackButton(title: "Log In", startLoading: authViewModel.startLoading)
                .opacity(buttonOpacity)
                .disabled(buttonDisabled)
                .onTapGesture {
                    withAnimation {
                        authViewModel.logIn()
                    }
                }
                .onReceive(authViewModel.$loginEnabled) { submitAllowed in
                    self.buttonDisabled = !submitAllowed
                    self.buttonOpacity = submitAllowed ? 1.0 : 0.5
                }
            Spacer()
        }.padding([.horizontal, .top], 60)
            .fullScreenCover(isPresented: $authViewModel.loginSucceeded) {
                NavigationView {
                    TimelineView(authViewModel: self.authViewModel)
                }
            }
            .errorAlert(error: $authViewModel.error)
    }
    
    @ToolbarContentBuilder
    private func ToolbarItems() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Image("logo")
                .resizable()
                .frame(width: 25, height: 25)
                .scaledToFit()
        }
    }
}
