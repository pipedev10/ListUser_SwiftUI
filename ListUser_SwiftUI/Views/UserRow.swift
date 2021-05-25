//
//  UserRow.swift
//  ListUser_SwiftUI
//
//  Created by Pipe Carrasco on 24-05-21.
//

import SwiftUI

struct UserRow: View {
    var user: UserModel
    
    var body: some View {
        HStack {
            Image(systemName: "face.smiling")
                .resizable()
                .clipShape(Circle())
                .shadow(radius: 3)
                .frame(width: 50, height: 50)
            Text(user.name)
            
            Spacer()
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserRow(user: users[0])
            UserRow(user: users[1])
        }.previewLayout(.fixed(width: 300, height: 70))
        
    }
}
