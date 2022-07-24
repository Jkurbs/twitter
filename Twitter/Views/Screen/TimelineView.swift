//
//  TimelineView.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//

import SwiftUI

struct TimelineView: View {
    
    @ObservedObject var timelineViewModel: TimelineViewModel = TimelineViewModel()
    @ObservedObject var authViewModel: AuthViewModel
    @State private var loginViewIsPresented: Bool = false
    @State private var alertIsPresented: Bool = false
    
    var body: some View {
        if let tweets = timelineViewModel.tweets {
            TweetsList(tweets)
        } else {
            ProgressView()
        }
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView(authViewModel: AuthViewModel())
            .previewDevice("iPhone 13 Pro Max")
    }
}

// MARK: - Extension
extension TimelineView {
    
    private func TweetsList(_ tweets: [Tweet]) -> some View {
        List {
            ForEach(tweets, id: \.id) { tweet in
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("\(tweet.user)")
                                .fontWeight(.medium)
                                .font(.system(size: 14))
                            Text("@\(tweet.username)")
                                .font(.system(size: 14))
                                .foregroundColor(Color.theme.label)
                                .multilineTextAlignment(.leading)
                        }
                        VStack {
                            Text(tweet.content)
                                .multilineTextAlignment(.leading)
                                .font(Font.system(size: 16))
                        }
                    }.padding()
                }
            }
        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItems()
        }
        .alert(isPresented: $alertIsPresented) {
            LogoutAlert()
        }
        .fullScreenCover(isPresented: $loginViewIsPresented, content: {
            NavigationView{ LogInView() }
        })
        .onAppear {
            UITableView.appearance().contentInset.top = -35
        }
    }
    
    private func LogoutAlert() -> Alert {
        Alert(
            title: Text("Are you sure?"),
            primaryButton: .default(Text("No"), action: {
                alertIsPresented = false
            }),
            secondaryButton: .destructive(Text("Log out"), action: {
                loginViewIsPresented = true
                authViewModel.logOut()
            })
        )
    }
    
    @ToolbarContentBuilder
    private func ToolbarItems() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Image("logo")
                .resizable()
                .frame(width: 25, height: 25)
                .scaledToFit()
        }
        ToolbarItem(placement: .automatic) {
            Button("Log out") {
                self.alertIsPresented = true
            }.tint(Color.black)
        }
    }
}
