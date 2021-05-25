//
//  UserList.swift
//  ListUser_SwiftUI
//
//  Created by Pipe Carrasco on 24-05-21.
//

import SwiftUI

struct UserList: View {
    @State var usersList: [UserModel] = []
    var body: some View {
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
                        //                  ErrorPresenter.showError(message: "There was an error getting the users", on: self)
                        print("There was an error getting the users")
                    case .success(let users):
                        print("users \(users)")
                        self.usersList = users
                    }
                }
                
            }
        }
        
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}
