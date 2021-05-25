//
//  UserDetail.swift
//  ListUser_SwiftUI
//
//  Created by Pipe Carrasco on 24-05-21.
//

import SwiftUI

struct UserDetail: View {
    var user: UserModel
    var body: some View {
        ScrollView {
            MapView(coordinate: user.address.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.title)

                HStack {
                    Text(user.username)
                    Spacer()
                    Text(user.email)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()
                
                Text("\(user.name) lives in \(user.address.street) in the city called \(user.address.city), he works in a company called \(user.company.name) and the webiste is \(user.website)")
                    .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.gray)
                
            }
            .padding()

        }.navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserDetail(user: users[0])
    }
}
