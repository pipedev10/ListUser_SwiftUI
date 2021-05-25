//
//  UserList.swift
//  ListUser_SwiftUI
//
//  Created by Pipe Carrasco on 24-05-21.
//

import SwiftUI

struct UserList: View {
    @State var usersList: [UserModel] = []
    @State var showAlert = false
    @State var btnClicked: ClickedButton = .none
    @State var isSucess = false
    @State var message: String = ""
    
    var body: some View {
        ZStack{
            NavigationView{
                List(usersList){ user in
                    NavigationLink(
                        destination: UserDetail(user: user)){
                        UserRow(user: user)
                    }
                   
                }.navigationTitle("User list")
                .onAppear{
                    NetworkClient().getAllUsers { result in
                        switch result {
                        case .failure:
                            showAlert = true
                            message = "There was an error getting the users"
                        case .success(let users):
                            self.usersList = users
                        }
                    }
                    
                }
            }.blur(radius: showAlert ? 30: 0)
            
            if showAlert {
                AlertMessage(show: $showAlert, btnClicked: $btnClicked, isSuccess: isSucess, message: message)
            }
        }
        
        
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}
