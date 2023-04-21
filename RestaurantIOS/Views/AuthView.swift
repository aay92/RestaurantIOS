//
//  AuthView.swift
//  RestaurantIOS
//
//  Created by Aleksey Alyonin on 21.04.2023.
//

import SwiftUI

struct AuthView: View {
    @State var deskNumber: String = ""
    @State var showEmployeeSignIn: Bool = false
    
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
                TextField("Введите номер столика", text: $deskNumber)
                    .padding()
                    .background(.white)
                    .font(.title3)
                    .cornerRadius(10)
                
                Button {
                    print("Вход")
                } label: {
                    Text("В меню!")
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
        .overlay(alignment: .bottomLeading) {
            Button {
                showEmployeeSignIn.toggle()
            } label: {
                Text("Вход для\nсотрудника")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.leading)

            }
        }
        .sheet(isPresented: $showEmployeeSignIn) {
            EmployeeSignInView()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
