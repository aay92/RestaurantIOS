//
//  EmployeeSignInView.swift
//  RestaurantIOS
//
//  Created by Aleksey Alyonin on 21.04.2023.
//

import SwiftUI

struct EmployeeSignInView: View {
    @State var login: String = ""
    @State var password: String = ""
    
    var body: some View {
        HStack(){
            Rectangle()
                .frame(width: 150)
                .ignoresSafeArea()
                .foregroundColor(Color("brown"))
                .opacity(0.7)
            Spacer()
        }
        .ignoresSafeArea()
        .background(Image("backView")
            .resizable()
            .ignoresSafeArea()
            .aspectRatio(contentMode: .fill))
        .overlay {
            VStack(spacing: 24) {
                Text("Вход для сотрудников")
                    .font(.title2)
                    .foregroundColor(.white).bold()
                TextField("Логин", text: $login)
                    .padding()
                    .background(.white)
                    .font(.title3)
                    .cornerRadius(10)
                
                SecureField("Пароль", text: $password)
                    .padding()
                    .background(.white)
                    .font(.title3)
                    .cornerRadius(10)
                
                Button {
                    print("Вход")
                } label: {
                    Text("Войти")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("brown"))
                .foregroundColor(.white)
                .font(.title3).bold()
                .cornerRadius(10)

            }
            .padding(.horizontal, 70)
        }
    }
}

struct EmployeeSignInView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeSignInView()
    }
}
