//
//  AlertMessage.swift
//  ListUser_SwiftUI
//
//  Created by Pipe Carrasco on 24-05-21.
//

import SwiftUI

enum ClickedButton {
    case ok
    case cancel
    case none
}

struct AlertMessage: View {
    @Binding var show: Bool
    @Binding var btnClicked: ClickedButton
    var isSuccess: Bool
    var message: String
    
    var body: some View {
        VStack{
            Image(isSuccess ? "check": "remove")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.top, 10)
            Spacer()
            Text(message)
            Spacer()
            Divider()
            HStack{
                Button("OK"){
                    show.toggle()
                    btnClicked = .ok
                }.frame(width: UIScreen.main.bounds.width/2 - 25,
                        height: 40)
                .foregroundColor(.white)
                
                Button("Cancel"){
                    show.toggle()
                    btnClicked = .cancel
                }.frame(width: UIScreen.main.bounds.width/2 - 25,
                        height: 40)
                .foregroundColor(.white)
            }
        }.frame(width: UIScreen.main.bounds.width-50, height: 200)
        .background(Color.black.opacity(0.5))
        .cornerRadius(12)
        .clipped()
    }
}

struct AlertMessage_Previews: PreviewProvider {
    static var previews: some View {
        AlertMessage(show: .constant(false), btnClicked: .constant(.none), isSuccess: false, message: "alert")
    }
}
