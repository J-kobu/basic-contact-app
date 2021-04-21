//
//  ContactDetailView.swift
//  BasicContactApp
//
//  Created by Jacob Aguilar on 21-04-21.
//

import SwiftUI

struct ContactDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    var contact: Contact
    
    var body: some View {
        ScrollView {
            VStack {
                Image(contact.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                
                Text(contact.name)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .frame(width: 300)
                    .lineLimit(2)
                
                Text(contact.description)
                    .font(.system(.body, design: .rounded))
                    .padding()
                
                Spacer()
                
            }
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            HStack {
                VStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        self.showAlert = true
                    }, label: {
                        Image(systemName: "chevron.compact.down")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 5, y: 2)
                    })
                    .padding()
                    Spacer()
                }
            }
        )
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: Contact(name: "Jorge Jara", image: "Jorge Jara"))
    }
}
